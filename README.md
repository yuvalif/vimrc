# vimrc
my vimrc (work in progress...)

 - clone the repo:
 ```bash
 git clone https://github.com/yuvalif/vimrc.git
 ```
 - get system dependencies for plugins (need to be sudo/root):
 ```bash
 cd vimrc
 ./fetch_dependencies.sh
 ```
 - open vim and run `:PlugInstall` to install plugins
 - symlink vimrc:
 ```bash
 cd ~
 ln -s vimrc/vimrc .vimrc
 ```
