# functions targeted to bind
set -l funcs underbar underbar_show underbar_paste
# specific function with its key sequence, one without key assignment not to bind
set -l underbar \eg
set -l underbar_paste \ei
set -l occupied
for func in $funcs
    set -q $func
    and if not bind -s $$func &>/dev/null
      bind $$func $func
    else
      set -a occupied (printf 'key-sequence %s is bound to %s.' (bind $$func | string split ' ' --)[-2..-1])
    end
    breakpoint
end
for occupier in $occupied
  	printf '[omf-underbar]\aOops, %s\n' $occupier
end
