function custom_theme -S
    set -l base03 002b36
    set -l base02 073642
    set -l base01 586e75
    set -l base00 657b83
    set -l base0 839496
    set -l base1 93a1a1
    set -l base2 eee8d5
    set -l base3 fdf6e3
    set -l yellow b58900
    set -l orange cb4b16
    set -l red dc322f
    set -l magenta d33682
    set -l violet 6c71c4
    set -l blue 268bd2
    set -l cyan 2aa198
    set -l green 859900

    set -l purple d488f9
    set -l limegreen 94fd3a
    set -l turquoise 79e9fd

    set colorfg $base3

    set -x color_username $purple
    set -x color_hostname $orange
    set -x color_cwd $limegreen
    set -x color_git_ref $turquoise
end
