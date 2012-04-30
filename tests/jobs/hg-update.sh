#! /bin/sh

repo="$1"
STATE_FILE=$(pwd)/.hg-state
if test -e $STATE_FILE; then
    state=$(cat $STATE_FILE)
    test $state -gt 1 && state=0
else
    state=0;
fi

case $state in
    (0) echo "::Create repo. -- continue -- updated::"
    hg init hg-repo
    touch hg-repo/hg-file
    cd hg-repo
    hg add hg-file
    hg commit -m "add hg file" hg-file -u foobar
    ;;
    (*) echo "::End. -- stop -- nothing::" ;;
esac

echo $(($state + 1)) > $STATE_FILE
