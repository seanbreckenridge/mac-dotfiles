# stuff that happens when you load an interactive shell

# list todos created by ~/dotfiles/bin/todo

todo_array=()
find "${HOME}/Desktop" -maxdepth 1 -type f -print0 | while IFS= read -r -d $'\0' file
do
    if (( $(awk 'FNR == 1 {found = /^TODO/}; found' "${file}" | wc -c) > 0 )); then
      todo_array+=("$file")
    fi
done

if (( ${#todo_array[*]} > 0 )); then # if there are todos
  printf "Tasks todo...\n\n"
  for todo in $todo_array; do
    echo -en "\\t📝 "
    echo -e $(basename "$todo")
  done
fi
