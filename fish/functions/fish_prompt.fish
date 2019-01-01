function fish_prompt
    printf "%s%s%s at %s%s%s in %s%s%s" \
        (set_color $color_username) $USER (set_color normal) \
        (set_color $color_hostname) $hostname (set_color normal) \
        (set_color $color_cwd) (prompt_pwd) (set_color normal)

    __fish_git_prompt " is working on (%s)"

    custom_fish_mode_prompt
end
