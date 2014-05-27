# A Git cheat sheet (MTM 2012-07-04)

## Getting started:

* Initialize: `$ git init`
* Add files (and folders): `$ git add <file>`
* Commit your changes: `$ git commit`
    * edit your commit message!!
    * **Shortcut:** `$ git commit -am "this is my commit message"`
      * the `-a` commits all files that were already added
      * the `-m` appends the commit message in quotes

## Workflow:

* Make changes to files
* Check status: `$ git status`
* add new files: `$ git add newfile.txt`
* Commit when finished: `$ git commit -a`

## Working with remote repos:

A remote repository (repo) is one that is separate from the code on
your local machine (working-copy). It can be in another location on
your machine (say, in `~/git/`), or on a different machine that you
access remotely.

1. Setup (same as for regular repo) - start on local machine:

    `$ cd ~/project`  
    `$ git init`  
    `$ git add <file>`  
    `$ git commit`  

2. create a *bare* clone (just the `.git/` stuff, no working-copy):

    `$ cd ..`  
    `$ git clone --bare ~/proj proj.git`  
    
3. move the bare clone to the desired location

    `$ mv proj.git ~/git/` **OR**  
    `$ scp -r proj.git user@server:git/`  

4. remove the original repo (on the local machine), and create a new
clone from the remote: 

    `$ mv ~/proj ~/proj.temp`  
    `$ git clone user@server:git/proj.git`  
    
5. Work on that copy, and do the usual:

    `$ git add newfiles.txt`  
    `$ git commit -a`

6. and when finished do:

    `$ git push`  
    to push changes back to the server.

7. To update a working copy from a repo (say, to work from home), do:

    `$ git pull`

## To fix mistakes:

* To reset the entire tree to the last commit:

    `$ git reset --hard HEAD`
    
* For single files:

    `$ git checkout filethatgotborked.txt`

## .gitignore file:

This is where you stick stuff that you *don't* want to include in the
repo (temporary files, images, backups, etc). Example:

    ## misc things
    *~
    *.pdf
    *.jpg
    *.bak
    
    ## latex stuff
    *.aux
    *.bbl
    *.blg
    *.bst
    *.log
    *.toc

    ## data stuff
    *.mat
    *.rda
    *.out
    
    ## things to keep
    !mynicedrawing.jpg
    !averysmalldatafile.rda

## Other useful commands:

* `$ git diff` to see changes since last commit (or compare commits)
* `$ git log` to see commit messages
* `$ gitk` to see a gui of the commit tree, messages, and diffs

## git command aliases:

You can create *aliases* for git commands by editing your `~/.gitconfig`
file, e.g.:

    [core]
        editor = emacs -q -nw

    [user]
        email = clark.richards@gmail.com

    [alias]
        st = status
        ci = commit
        br = branch
        co = checkout
        df = diff
        lg = log -p
        ft = fetch
        mg = merge
        pl = pull
        ps = push

## Other Resources:

* Get Git: www.git-scm.com
* GitHub.com (free and paid git repo hosting with a **TON** of
  features)
    * also see http://help.github.com
	* Github app
* GitX (git gui for OS X)
