
if [ -d $HOME/go ]; then
    export GOPATH=$HOME/go

    if type go > /dev/null; then
        export PATH=$PATH:$(go env GOPATH)/bin
    fi
fi
