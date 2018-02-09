alias g='function _g(){ grep -riIn "$1" --include=*.$2 .; };_g'
export EDITOR=vim
set -o vi
alias gpush='git push -u && git push --tags'
alias glog='git log --decorate'
alias gtags='git tag -n99'
