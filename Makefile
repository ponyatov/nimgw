CWD     = $(CURDIR)
MODULE  = $(notdir $(CWD))
OS     ?= $(shell uname -s)

NOW = $(shell date +%d%m%y)
REL = $(shell git rev-parse --short=4 HEAD)

NIMBLE = $(HOME)/.nimble/bin/nimble
NIM    = $(HOME)/.nimble/bin/nim



.PHONY: all test

all: hellomsg.exe
# hello.exe 

%.exe: src/%.nim $(MODULE).nimble Makefile src/nim.cfg
	rm -rf nimcache
	nimpretty --indent:2 $<
	nimble build && i686-w64-mingw32-objdump -x $@ > $@.objdump
	wine $@



.PHONY: install
install: debian $(NIMBLE)

.PHONY: update
update: debian

.PHONY: debian
debian:
	sudo dpkg --add-architecture i386
	sudo apt update
	sudo apt install -u `cat apt.txt`

$(NIMBLE):
	curl https://nim-lang.org/choosenim/init.sh -sSf | sh



.PHONY: master shadow release

MERGE  = Makefile README.md .gitignore .vscode apt.txt
MERGE += $(MODULE).nimble src tests

master:
	git checkout $@
	git pull -v
	git checkout shadow -- $(MERGE)

shadow:
	git checkout $@
	git pull -v

release:
	git tag $(NOW)-$(REL)
	git push -v && git push -v --tags
	git checkout shadow
