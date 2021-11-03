M-x package-install
# elpy
dependency
```
archives
pyvenv-1.21
company-0.9.13
s-1.12.0
elpy-1.35.0
yasnippet-0.14.0
highlight-indentation-0.7.0
```

# flycheck
dependency
```
epl-0.9
flycheck-31
dash-2.19.1
pkg-info-0.6
```

# counsel
dependency
```
counsel-0.13.4
swiper-0.13.4
ivy-0.13.4
```

# elpy settings
```
M-x elpy-config
```
```
(自動インストール)elpy is installing the RPC...
or 
(手動再インストール)elpy-rpc-reinstall-virtualenv
```
venvが使えない場合：
```
sudo apt install virtualenv
```
## jedi0.17.0
最新版jedi0.18.0はemacs27と相性が悪いため,0.17.0を使用する  
下記コマンドでインストールされるのはjedi0.17.2
```
source .emacs.d/elpy/rpc-venv/bin/activate
(rpc-venv)pip3 install jedi~=0.17.0
(rpc-venv)pip3 install autopep8 yapf black flake8
```