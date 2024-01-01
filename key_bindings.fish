# functions targeted to bind
set -l funcs underbar underbar_show underbar_paste
# specific function with its key sequence, one without key assignment not to bind
set -l underbar \eg
set -l underbar_paste \ei
set -l conflicted
for func in $funcs
    set -q $func
    and if not bind -s $$func &>/dev/null
      bind $$func $func
    else
      set -l cmd_name (bind $$func | string split ' ' --)[-1]
      if not contains $cmd_name $funcs
        set -a conflicted (printf 'key-sequence %s is bound to %s.' $cmd_name)
      end
    end
end
for conflict in $conflicted
    printf '[omf-underbar]\aOops, %s\n' $conflict
end
