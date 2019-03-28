# go env setting
set -x GOOS linux
set -x GOARCH amd64
set -x GOROOT (go env GOROOT)
set -x GOPATH $HOME/go
for p in $GOPATH
    set PATH $p/bin $PATH
end
set -x PATH $PATH $GOROOT/bin $GOPATH/bin $GAE_SDK_ROOT
set -x PATH $PATH $HOME/.linuxbrew/opt/go/libexec/bin
