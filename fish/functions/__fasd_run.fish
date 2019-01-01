function __fasd_run -e fish_preexec
    if type -q disown
        command fasd --proc (command fasd --sanitize "$argv" | tr -s ' ' \n) >"/dev/null" 2>&1 &
        disown
    else
        command fasd --proc (command fasd --sanitize "$argv" | tr -s ' ' \n) >"/dev/null" 2>&1 &
    end
end
