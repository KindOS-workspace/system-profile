#!/bin/sh

# DESCRIPTION: Provides a function to increase the tag and push changes to a git repository

tag_and_push() {
  increment_version() {
    version="$1"
    major=$(echo "$version" | cut -d. -f1)
    minor=$(echo "$version" | cut -d. -f2)
    patch=$(echo "$version" | cut -d. -f3)

    patch=$((patch + 1))

    new_version="${major}.${minor}.${patch}"
    echo "$new_version"
  }

  current_tag=$(git describe --abbrev=0 --tags)
  new_version=$(increment_version "$current_tag")

  git tag "$new_version"
  git push origin "$new_version"
}

export -f tag_and_push
