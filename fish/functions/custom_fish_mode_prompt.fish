function custom_fish_mode_prompt
    set -l glyph "~>"
    set -l mode
    switch $fish_bind_mode
        case default
            set mode cmd
        case insert
            set mode ins
        case replace_one
            set mode rep
        case visual
            set mode vis
        case '*'
            set mode unk
    end
    printf "\n[$mode] $glyph "
end
