# OSx application settings

We all ended up that moment when restoring the OS or having a new computer, we download the applications over again and re-configure everything as before.

`Let's stop wasting time` and be focused on other stuff.

Therefore this project goal is to enable settings backup and restore for different system applications and configurations. Additionally, several scripts are provided to give you a hand whener you need the most, to minimize either over-complciated tasks or annoying ones.  


# Applications supported

This list will grow with time and as much as needed :)

* iTerm2
* Sublime Text 3
* Visual Studio Code
* ZSHRC

# Scripts

* `git_update_repos.sh` - Automatically (from origin) fetch branches and/or tags and pull all changes, from git repositories.

## How to run

`git_update_repos.sh ~/git` - **~/git** is the target folder where your git repos are located.

## Validations

When running the script several validations are put in place:

* Target directory exists
* Bash version 4 is needed
* SSH keys exist
* Target dir has git repositories in it
* SSH identities are available in the ssh agent, so that user is not prompted constatly for ssh key password


## Outcome

During the execution the current repo under scan and the operation in course are identified. Also the output from the git commands are preserved to the sdout so user can check the news:

```
Fetching origin -> [xpto/]
remote: Counting objects: 63, done.
remote: Compressing objects: 100% (30/30), done.
remote: Total 63 (delta 33), reused 35 (delta 28), pack-reused 5
Unpacking objects: 100% (63/63), done.
From github.com:xpto_org/xpto
   51a53af..3240064  master                               -> origin/master
   f8fdc56..bde5c2b  feature-recommendations     	  -> origin/feature-recommendations
   97f2074..585b268  get-latest-reviews			  -> origin/get-latest-reviews
   2c256c3..26ff447  seo-fixes                            -> origin/seo-fixes
Pulling new code -> [xpto/]
```

After repos scan and fetch/pull an output is given with a summary identical to:

```
Summary
_________________
Updated repos: 29
Non repos found: 8
Errors found:
** gdax-python/ -> error: Your local changes to the following files would be overwritten by merge:
	gdax/authenticated_client.py
	setup.py
Please commit your changes or stash them before you merge.
Aborting
Updating 05ce2e2..de5f62b
** c4d90cddb60b300e595c027d7f00c65e/ -> Host key verification failed.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

# Usage

On each application diretory you can find two main scripts:

`copy-settings.sh` - copies the settings file from your application to this repository, overwriting the existing one. 

`export-settings.sh` - restores the settings file this repository to the application settings directory, overwriting the existing one if any.

# Contributions

Please feel free to clone this and make your adjustments. If you want to, you can also submit a PR with improvements.
