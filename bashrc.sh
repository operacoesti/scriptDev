function title {
    echo -ne "\033]0;"$*"\007"
}

cd() {
  builtin cd "$@" || return
  #echo $PREV_PWD
  if [ "$PWD" != "$PREV_PWD" ]; then
    PREV_PWD="$PWD";
    title $(echo ${PWD##*/}) $(node -v);
    if [ -e ".nvmrc" ]; then
      nvm use;
      # set tab terminal name to be cwd and node version
      title $(echo ${PWD##*/}) $(node -v);
    else
      nvm use default;
    fi
  fi
}
