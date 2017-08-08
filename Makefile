# Makefile

dir = $(shell basename $(shell pwd))

all:
	@echo Try one of:
	@echo 	"'make initial; make prep' to create the starting point"
	@echo 	"from the starting point procede with 'make merge' or"
	@echo 	"from the starting point procede with one of 'make cherrypick_' or"
	@echo 	"from the starting point procede with 'make rebase'"

links:
	@echo "https://www.atlassian.com/git/tutorials/merging-vs-rebasing"

initial:
	rm -rf .git *.c
	(cd ..; git init $(dir))
	git add Makefile
	git commit -m "Makefile"

prep:
	@echo "--------------------------------"
	@echo "void f1()\n{}\n" >>f1.c
	git add f1.c
	git commit -m "added f1()"
	@echo "--------------------------------"
	git checkout -b B
	@echo "void B_f()\n{}\n" >>B_f.c
	git add B_f.c
	git commit -m "added B_f()"
	@echo "--------------------------------"
	@echo "void B_g()\n{}\n" >>B_g.c
	git add B_g.c
	git commit -m "added B_g()"
	@echo "--------------------------------"
	@echo "void B_h()\n{}\n" >>B_h.c
	git add B_h.c
	git commit -m "added B_h()"
	@echo "--------------------------------"
	git checkout master
	@echo "void f2()\n{}\n" >>f2.c
	git add f2.c
	git commit -m "added f2()"
	@echo "--------------------------------"

merge:
	git checkout master
	git merge B -m "merged B into master"

cherrypick-B_h:
	git checkout master
	git cherry-pick B~0

cherrypick-B_g:
	git checkout master
	git cherry-pick B~1

cherrypick-B_f:
	git checkout master
	git cherry-pick B~2

cherrypick-B_gh:
	git checkout master
	git cherry-pick B~2..B~0

cherrypick-B_fg:
	git checkout master
	git cherry-pick B~3..B~1

cherrypick-B_fgh:
	git checkout master
	git cherry-pick B~3..B~0

rebase-master:
	@echo "DANGEROUS: You should not rewrite the history of a public branch. 'master' might be one."
	git checkout master
	git rebase B

rebase-B:
	git checkout B
	git rebase master