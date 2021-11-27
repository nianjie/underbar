function underbar_show --description 'show the content of the $underbar.'
  if count $underbar &>/dev/null
    printf \n
    set --show underbar
    commandline -f repaint
  else
    printf \a
  end
end
