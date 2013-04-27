alias ll 'ls -al'
alias lsl 'ls -l'
alias bs2 'screen -X encoding big5; telnet -8 bs2.to; screen -X encoding utf8'
alias grep 'grep --color=auto'
alias v 'vim -p'

if ($?prompt) then
  if(! $?WINDOW ) then
    set prompt="%{^[[1;36m%}%T%{^[[m%}%{^[[1;33m%}%n%{^[[m%}@%{^[[1;37m%}%m%{^[[1;32m%}[%~]%{^[[m%}> "
  else
    set prompt="%{^[[1;36m%}%T%{^[[m%}%{^[[1;33m%}%n%{^[[m%}@%{^[[1;37m%}%m%{^[[1;32m%}[%~]%{^[[m%}%{^[[1;35m%}[W$WINDOW]%{^[[m%}> "
  endif
  if ($?tcsh) then
    set mail = (/var/mail/$USER)
    bindkey "^W" backward-delete-word
    bindkey -k up history-search-backward
    bindkey -k down history-search-forward
  endif
endif

#echo remember to run screen -r
setenv LANG zh_TW.UTF-8

# Let "ls" has pretty color
setenv CLICOLOR yes
setenv LSCOLORS GxFxFxDxBxegedabagGxGx
#1. directory
#2. symbolic link
#3. socket
#4. pipe
#5. executable
#6. block special
#7. character special
#8. executable with setuid bit set
#9. executable with setgid bit set
#10.directory writable to others, with sticky bit
#11.directory writable to others, without sticky bit

# Set vim as default editor
setenv EDITOR vim

set autoexpand
set autolist
set color

