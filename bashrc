export EDITOR=vim
set -o vi
function vl() { vim $( locate $1 --limit 1 -i ); }
function vf() { vim $( find . -name nerdtree | head -n 1 ); }
