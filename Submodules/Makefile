.PHONY: core git-hg nlohmann-json noob ssh-askpass uti

all: core git-hg nlohmann-json noob ssh-askpass uti

config:
	cd jarryshaw-core && git remote add upstream https://github.com/homebrew/homebrew-core.git

.ONESHELL:
sync:
	cd jarryshaw-core
	set -ex
	git checkout master
	git pull upstream master
	git push origin master

core:
	git submodule add -f https://github.com/JarryShaw/homebrew-core.git jarryshaw-core

git-hg:
	git submodule add -f https://github.com/cosmin/git-hg.git cosmin-git-hg

nlohmann-json:
	git submodule add -f https://github.com/nlohmann/homebrew-json.git nlohmann-json

noob:
	git submodule add -f https://github.com/zmwangx/homebrew-npm-noob.git zmwangx-npm-noob

ssh-askpass:
	git submodule add -f https://github.com/theseal/homebrew-ssh-askpass.git theseal-ssh-askpass

uti:
	git submodule add -f https://github.com/alexaubry/homebrew-formulas.git alexaubry-formulas
