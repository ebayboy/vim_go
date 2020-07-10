#!/bin/bash


function install_tools {
    go get -v github.com/ramya-rao-a/go-outline
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
}


#ln -s ${PWD}/.vim /root/.
#ln -s ${PWD}/.vimrc /root/.

install_tools


