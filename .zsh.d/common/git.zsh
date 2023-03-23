git_revert_file_change() {
  git show $1 -- $2 | git apply -R
}

