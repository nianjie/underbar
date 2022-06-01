set -f occupied
if not bind -s \eg &>/dev/null
   bind \eg underbar
else
   set -a occupied (printf 'key-sequence %s is bound to %s.' (bind \eg | string split ' ' --)[-2..-1])
end
if not bind -s \ei &>/dev/null
   bind \ei underbar_show
else
  set -a occupied (printf 'key-sequence %s is bound to %s.' (bind \ei | string split ' ' --)[-2..-1])
end
for occupier in $occupied
  	printf '[omf-underbar]\aOops, %s\n' $occupier
end
