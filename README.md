# Plasma Desktop Settings:
## Emacs Keybind
```
~/.gtkrc-2.0
gtk-key-theme-name = “Emacs”

~/.config/gtk-3.0/settings.ini
gtk-key-theme-name = Emacs
```

## iBus-Anthy

## タスクマネージャーの設定
[タスクマネージャーを設定]→[挙動]→[最小化されたタスクのみを表示する]

## ウィンドウの管理
[設定]→[ショートカット]→[KWin]

## Emacs install
emacs 27.2 - macOS:  
http://ftp.gnu.org/gnu/emacs/emacs-27.2.tar.xz  
```
./configure --without-ns --without-ns --with-x-toolkit=no --with-xpm=ifavailable --without-makeinfo --prefix=$HOME/.local  
make && make install
```
emacs 27.2 - Linux:  
```
./configure --without-x --with-x-toolkit=no --with-xpm=ifavailable --with-jpeg=ifavailable --with-png=ifavailable --with-gif=ifavailable --with-tiff=ifavailable --with-gnutls=ifavailable --prefix=$HOME/.local
make && make install
```

Ubuntu22.04でコンパイルエラーが出る場合:
```
1821行目:
static unsigned char sigsegv_stack[SIGSTKSZ];
```
上記の部分を、
```
static max_align_t sigsegv_stack[(64 * 1024 + sizeof (max_align_t) - 1) / sizeof (max_align_t)];
```
に置き換えてコンパイルする。