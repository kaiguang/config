# Overwrite the current system Neovim config

rm -rf ~/.config/nvim/
rm -rf ~/.local/share/nvim/

mkdir -p ~/.config/nvim/
cp ./HOME/.config/nvim/init.lua ~/.config/nvim/
