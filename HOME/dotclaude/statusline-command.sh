#!/bin/bash
# Statusline generated from zsh PS1:
#   export PS1='%F{cyan}%~%f${vcs_info_msg_0_}%# '
# with vcs_info format '%F{yellow}(%r:%b%u%c)%f'

input=$(cat)
dir=$(echo "$input" | jq -r '.workspace.project_dir // .cwd')

# rate_limits is only populated on refreshes tied to an API response; other
# refreshes send null, which would blank the segment. Cache the last non-null
# value and fall back to it.
rl_cache="$HOME/.claude/.statusline-rate-limits.json"
rate_limits=$(echo "$input" | jq -c '.rate_limits // null')
if [ -n "$rate_limits" ] && [ "$rate_limits" != "null" ]; then
  printf '%s' "$rate_limits" > "$rl_cache"
elif [ -s "$rl_cache" ]; then
  rate_limits=$(cat "$rl_cache")
else
  rate_limits=null
fi

# %~  -> current directory, with $HOME shown as ~
display_dir="${dir/#$HOME/~}"

# vcs_info segment: (repo:branch<unstaged><staged>)
git_segment=""
if git_top=$(git -C "$dir" --no-optional-locks rev-parse --show-toplevel 2>/dev/null); then
  branch=$(git -C "$dir" --no-optional-locks branch --show-current 2>/dev/null)
  if [ -n "$branch" ]; then
    repo_name=$(basename "$git_top")
    unstaged=""
    staged=""
    git -C "$dir" --no-optional-locks diff --quiet 2>/dev/null || unstaged=" *"
    git -C "$dir" --no-optional-locks diff --cached --quiet 2>/dev/null || staged=" +"
    git_segment=$(printf '\033[33m(%s:%s%s%s)\033[0m' "$repo_name" "$branch" "$unstaged" "$staged")
  fi
fi

printf '\033[36m%s\033[0m%s' "$display_dir" "$git_segment"

# Model / effort / context usage segment
model_name=$(echo "$input" | jq -r '.model.display_name // empty')
effort_level=$(echo "$input" | jq -r '.effort.level // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Fetch used_percentage for a rate_limits.<key> entry (e.g. "five_hour", "seven_day").
rate_limit_pct() {
  echo "$rate_limits" | jq -r --arg key "$1" '.[$key].used_percentage // empty'
}

# Fetch resets_at for a rate_limits.<key> entry, normalized to epoch seconds.
# resets_at may arrive as epoch seconds (number) or an ISO 8601 string
# (e.g. "2026-07-28T21:30:00Z" or with a +HH:MM/-HH:MM offset). Fractional
# seconds are stripped since strptime/fromdateiso8601 can't parse them.
rate_limit_resets_epoch() {
  echo "$rate_limits" | jq -r --arg key "$1" '
    try (
      (.[$key].resets_at // empty) as $r
      | if ($r | type) == "number" then ($r | floor)
      else
        ($r | tostring | sub("\\.[0-9]+"; "")) as $s
        | if ($s | test("Z$")) then
            ($s | strptime("%Y-%m-%dT%H:%M:%SZ") | mktime)
          elif ($s | test("[+-][0-9]{2}:[0-9]{2}$")) then
            ($s[0:19] | strptime("%Y-%m-%dT%H:%M:%S") | mktime) as $epoch
            | ($s[-6:]) as $off
            | ($off[1:3] | tonumber) as $oh
            | ($off[4:6] | tonumber) as $om
            | (($oh * 3600 + $om * 60) * (if ($off[0:1] == "-") then -1 else 1 end)) as $offsec
            | ($epoch - $offsec)
          else
            ($s | strptime("%Y-%m-%dT%H:%M:%S") | mktime)
          end
      end
    ) catch empty
  '
}

# Render "in X hr Y min", or (when $2=1 and a day or more remains) "in D days H hr".
format_relative_reset() {
  local diff="$1" use_days="$2"
  [ "$diff" -lt 0 ] && diff=0
  if [ "$use_days" = "1" ] && [ "$diff" -ge 86400 ]; then
    local days=$(( diff / 86400 ))
    local hrs=$(( (diff % 86400) / 3600 ))
    echo "in ${days} days ${hrs} hr"
  else
    local hrs=$(( diff / 3600 ))
    local mins=$(( (diff % 3600) / 60 ))
    if [ "$hrs" -gt 0 ]; then
      echo "in ${hrs} hr ${mins} min"
    else
      echo "in ${mins} min"
    fi
  fi
}

five_hour_pct=$(rate_limit_pct "five_hour")
five_hour_resets_epoch=$(rate_limit_resets_epoch "five_hour")
seven_day_pct=$(rate_limit_pct "seven_day")
seven_day_resets_epoch=$(rate_limit_resets_epoch "seven_day")

info_parts=()
[ -n "$model_name" ] && info_parts+=("$model_name")
[ -n "$effort_level" ] && info_parts+=("effort:$effort_level")
[ -n "$used_pct" ] && info_parts+=("$(printf 'ctx:%.0f%%' "$used_pct")")

now=$(date +%s)

if [ -n "$five_hour_pct" ] && [ -n "$five_hour_resets_epoch" ]; then
  diff=$(( ${five_hour_resets_epoch%.*} - now ))
  reset_str=$(format_relative_reset "$diff" "0")
  info_parts+=("$(printf '5h:%.0f%% (%s)' "$five_hour_pct" "$reset_str")")
fi

if [ -n "$seven_day_pct" ] && [ -n "$seven_day_resets_epoch" ]; then
  diff=$(( ${seven_day_resets_epoch%.*} - now ))
  reset_str=$(format_relative_reset "$diff" "1")
  info_parts+=("$(printf 'wk:%.0f%% (%s)' "$seven_day_pct" "$reset_str")")
fi

if [ "${#info_parts[@]}" -gt 0 ]; then
  info_str="${info_parts[0]}"
  for part in "${info_parts[@]:1}"; do
    info_str="$info_str | $part"
  done
  printf ' \033[2m[%s]\033[0m' "$info_str"
fi
