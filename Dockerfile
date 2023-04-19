FROM ubuntu

WORKDIR /root
RUN apt update && apt upgrade -y && apt install -y \
cmake \
curl \
gettext \
git \
g++ \
make \
ninja-build \
ripgrep \
unzip \
wget

RUN git clone https://github.com/neovim/neovim
RUN cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=Release && make install
RUN rm -rf neovim

RUN git clone https://github.com/Kaiguang/config.git
RUN cd config && ./setupBash.sh && ./setupGit.sh && ./setupNvim.sh

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
RUN nvm install node

CMD bash
