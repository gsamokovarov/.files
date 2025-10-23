function z
    set -l base_dir $JUMP_BASE_DIR
    if test -z "$base_dir"
        set base_dir "$(command git rev-parse --show-toplevel)"
    end
    j "$base_dir" $argv
end
