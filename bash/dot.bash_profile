

if [ -f ~/.bashrc ] ; then
	source ~/.bashrc
fi



###  Tips


# "~/.bash_profile"を読み込む場合

# bashが対話的なログインシェルとして起動されるか、 --login オプション付きの非対話的シェルとして起動されると、/etc/profile からコマンドを読み込んで実行した後、以下の順番でファイルを探し、最初に見つかった読み込み可能なファイルからコマンドを実行する。

#    1. ~/.bash_profile
#    2. ~/.bash_login
#    3. ~/.profile

# "~/.bashrc"を読み込む場合

# ログインシェルでない対話的シェルとして起動されると、~/.bashrc ファイルがあれば、 bash はここからコマンドを読み込み、実行する。
# よく見かける .bash_profile と .bashrc の組み合わせ

# 以下のように、 .bash_profile 内で .bashrc を読み込ませる。こうしておけば、ログインシェルか否かにかかわらず .bashrc を読み込んでくれる。従って、日常的なシェル環境の設定は .bashrc の方に書いておけば良い。

# ~/.bash_profile

#     if [ -f ~/.bashrc ]; then
#             . ~/.bashrc
#     fi

# ~/.bashrc

#     PS1="[\u@\h \W]\$ "
#     export PS1
#     alias rm='rm -i'
#     alias cp='cp -i'
#     alias mv='mv -i'
#     ...




