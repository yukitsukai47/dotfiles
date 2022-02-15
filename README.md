emacs 27.2 - macOS:  
http://ftp.gnu.org/gnu/emacs/emacs-27.2.tar.xz  
```
mkdir ~/local  
./configure --without-ns --with-x-toolkit=no --with-xpm=ifavailable --without-makeinfo --prefix=$HOME/local  
make && make install
```
emacs 27.2 - Linux:  
```
mkdir ~/local
./configure --with-x-toolkit=no --with-xpm=ifavailable --with-jpeg=ifavailable --with-png=ifavailable --with-gif=ifavailable --with-tiff=ifavailable --with-gnutls=ifavailable --prefix=$HOME/local
make && make install
```
