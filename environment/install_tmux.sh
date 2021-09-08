#!/bin/bash

# 1. download tmux and related components
wget -c https://github.com/tmux/tmux/releases/download/3.0a/tmux-3.0a.tar.gz
wget -c https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz
wget -c https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz

# 2. unzip files
tar -xzvf tmux-3.0a.tar.gz
tar -xzvf libevent-2.1.11-stable.tar.gz
tar -xzvf ncurses-6.2.tar.gz

# 3. install two dependencies from source code
cd  libevent-2.1.11-stable

./configure --prefix=$HOME/tmux_depend --disable-shared
make && make install

cd  ncurses-6.2
./configure --prefix=$HOME/tmux_depend
make && make install

# 4. install tmux
cd  tmux-3.0a
./configure CFLAGS="-I$HOME/tmux_depend/include -I/$HOME/tmux_depend/include/ncurses" LDFLAGS="-L/$HOME/tmux_depend/lib -L/$HOME/tmux_depend/include/ncurses -L/$HOME/tmux_depend/include"
make
cp tmux  $HOME/tmux_depend/bin

# 5. setup environments (export suggested to be added in .bashrc file)
export PATH=$HOME/tmux_depend/bin:$PATH
source ~/.bashrc
