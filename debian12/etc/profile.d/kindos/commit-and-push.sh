#!/bin/bash

commit_and_push() {
    if [ $# -eq 0 ]; then
        echo "Please provide a commit message."
        return 1
    fi

    commit_message="$1"

    # Perform the commit
    git add .
    git commit -m "$commit_message"

    # Push changes to remote repository
    git push origin main  # Change 'main' to your branch name if needed
}
export -f commit_and_push
