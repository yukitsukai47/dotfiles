emacs 27.2 - macOS:  
http://ftp.gnu.org/gnu/emacs/emacs-27.2.tar.xz  
mkdir ~/local  
./configure --without-ns --with-x-toolkit=no --with-xpm=ifavailable --without-makeinfo --prefix=$HOME/local  
make && make install
