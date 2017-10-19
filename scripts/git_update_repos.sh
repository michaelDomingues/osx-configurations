#!/usr/bin/env bash

bash_version=$(/usr/bin/env bash --version | grep -o "GNU bash, version [0-9]*\.")

# Bash 4 version is needed!
if [ ! "$(echo ${bash_version} | grep -oE "[0-9]+" )" -ge "4" ]; then
	echo "You need to update Bash to version 4!"
	echo "Current: ${bash_version}"
	echo "On OSX you can do: brew install bash | brew upgrade bash"
	exit 1
fi

# Check if ssh agent has the necessary keys for the process
if [[ $(ssh-add -l) =~ "The agent has no identities" ]]; then
	echo "No identities available in the ssh agent."
	echo "In order to avoid contant prompts, add all needed keys using: ssh-add <private ssh key>"
	echo ""
fi

SSH_DIR="${HOME}/.ssh"
CURRENT_DIR=${PWD}
ROOT_DIR=${1}

cd ${ROOT_DIR}

if [ -z ${ROOT_DIR} ]; then
	echo "Usage: ./scripts/git_update_repos.sh <target_dir>"
	exit 1
elif [ ! -d ${ROOT_DIR} ]; then
	echo "Directory does not exist!"
	exit 1
elif [ $(find ${ROOT_DIR} -mindepth 1 -maxdepth 1 -type d | wc -l) -eq 0 ]; then
	echo "Target root dir has no child directories"
	exit 1
elif [ $(find ${SSH_DIR} -type f -name "*.pub" | wc -l) -eq 0 ]; then
	echo "SSH public keys not found."
	exit 1
fi

declare -i count_non_git_repos=0
declare -i count_git_repos=0
declare -A repo_errors

#Looping through all child directories
for child_dir in $(ls -d */); do
	if [ ! -z $(find ${child_dir} -type d -name ".git") ];then
		cd ${child_dir}
		echo "Fetching origin -> [${child_dir}]"
		git fetch origin
		echo "Pulling new code -> [${child_dir}]"
		result=$(git pull origin 2>&1)

		# If an error occurred, save the output for the final summary
		if [ ! $? -eq 0 ]; then
			repo_errors["${child_dir}"]="${result}"
		fi

		count_git_repos+=1
		cd ..
	else
		count_non_git_repos+=1
	fi
done


printf "\nSummary\n"
echo "_________________"
echo "Updated repos: ${count_git_repos}"
echo "Non repos found: ${count_non_git_repos}"
echo "Errors found:"
for repo in "${!repo_errors[@]}"; do
	echo "** ${repo} -> ${repo_errors[${repo}]}"
done
