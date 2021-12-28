#!/bin/bash

set -e	# or use "set -o errexit" to quit on error.
set -x  # or use "set -o xtrace" to print the statement before you execute it.

function install_tools {
    go get -v github.com/kisielk/errcheck
    go get -v github.com/jstemmer/gotags
    go get -v github.com/klauspost/asmfmt/cmd/asmfmt
    go get -v github.com/fatih/motion
    go get -v github.com/golangci/golangci-lint/cmd/golangci-lint
    go get -v honnef.co/go/tools/cmd/keyify
    go get -v golang.org/x/lint/golint
    go get -v github.com/ramya-rao-a/go-outline
    go get -v golang.org/x/tools/cmd/guru
    go get -v github.com/bradfitz/goimports
    go get -v github.com/acroca/go-symbols
    go get -v github.com/mdempsky/gocode
    go get -v github.com/rogpeppe/godef
    go get -v github.com/zmb3/gogetdoc
    go get -v github.com/fatih/gomodifytags
    go get -v sourcegraph.com/sqs/goreturns
    go get -v github.com/cweill/gotests/...
    go get -v github.com/josharian/impl
    go get -v github.com/haya14busa/goplay/cmd/goplay
    go get -v github.com/uudashr/gopkgs/cmd/gopkgs
    go get -v github.com/davidrjenni/reftools/cmd/fillstruct
    go get -v github.com/alecthomas/gometalinter
    go get -v github.com/Go-zh/tools/cmd/gopls
}


ln -s ${PWD}/.vim /root/.
ln -s ${PWD}/.vimrc /root/.

install_tools

#:GoInstallBinaries

