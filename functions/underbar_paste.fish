function underbar_paste --description 'paste selected item to command line from a menu generated from items contained in $underbar'
  if count $underbar &>/dev/null
    printf '\n'
    if type -q fzf 
      list_underbar_turbo
    else
      list_underbar
    end
  else
    printf \a
  end
end

function list_underbar_turbo
  commandline -i -- (printf '%s\n' $underbar | fzf)
end

function list_underbar --no-scope-shadowing
  set items_c (count $underbar)
  set -l letters a b c d e f g h i j k l m n o p q r s t u v w x y z
  for i in (seq $items_c -1 1)
    set -l item $underbar[$i]
    set -l label_color normal
    set -q fish_color_cwd
    and set label_color $fish_color_cwd
    set -l dir_color_reset (set_color normal)
    set -l dir_color

    printf '%s %s %2d) %s %s%s%s\n' (set_color $label_color) $letters[$i] $i (set_color normal) $dir_color $item $dir_color_reset
  end

  set -l msg (_ 'Select item by letter or number: ')
  read -l -p "echo '$msg'" choice
  if test -z "$choice"
    commandline -f repaint
  else if string match -q -r '^[a-z]$' $choice
    # Convert the letter to an index number.
    set choice (contains -i $choice $letters)
    commandline -i -- $underbar[$choice]
  end
  
end