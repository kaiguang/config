FROM ubuntu:24.04
SHELL ["/bin/bash", "-c"]

# Install basic tools
RUN apt update && apt upgrade -y
RUN apt install -y autojump curl git openssh-client vim

# SSH keys
RUN mkdir -p /root/.ssh
RUN --mount=type=secret,id=SSH_KEY_PUB,env=SSH_KEY_PUB echo "$SSH_KEY_PUB" > /root/.ssh/id_rsa.pub
RUN --mount=type=secret,id=SSH_KEY_PRIV,env=SSH_KEY_PRIV echo "$SSH_KEY_PRIV" > /root/.ssh/id_rsa
RUN chmod 400 /root/.ssh/id_rsa

# git clone repos
WORKDIR /root/w/gh-kaiguang
RUN ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts
RUN git clone git@github.com:kaiguang/config.git
RUN git clone git@github.com:kaiguang/notebook.git

# git config
WORKDIR /root
COPY ./HOME/dotgitconfig ./.gitconfig
RUN sed -i 's$signingkey = /Users/kai/.ssh/id_rsa.pub$signingkey = /root/.ssh/id_rsa.pub$' ./.gitconfig

# .bashrc
WORKDIR /tmp
RUN curl -o ~/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
RUN curl -o ~/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
COPY ./HOME/dotbashrc ./.bashrc
RUN cat .bashrc >> ~/.bashrc && rm .bashrc

# autojump
RUN git clone --depth=1 https://github.com/wting/autojump.git
WORKDIR /tmp/autojump
RUN SHELL=/bin/bash ./install.py
RUN echo "[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh" >> ~/.bashrc
WORKDIR /tmp
RUN rm -rf autojump

WORKDIR ~
