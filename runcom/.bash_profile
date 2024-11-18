#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#
# Shell Detection
#

declare -A SHELL_INFO=(
    [ZSH]=false
    [BASH]=false
)

if [ -n "$ZSH_VERSION" ]; then
    SHELL_INFO[ZSH]=true
elif [ -n "$BASH_VERSION" ]; then
    SHELL_INFO[BASH]=true
fi

#
# OS Detection
#

case "$(uname -s)" in
    Sequoia*)
        OS="Sequoia"
        ;;
    Linux*)
        OS="Linux"
        ;;
    *)
        OS="Unknown"
        ;;
esac

#
# Utility Functions
#

debug() {
    if [[ "${DOTFILES_DEBUG}" == "true" ]]; then
        echo "DEBUG: $*"
    fi
}

error() {
    echo "ERROR: $*" >&2
}

#
# Dotfiles Directory Resolution
#

resolve_dotfiles_dir() {
    local current_script readlink_cmd script_path

    # Prefer greadlink (GNU readlink) over BSD readlink
    readlink_cmd=$(command -v greadlink || command -v readlink)

    if ${SHELL_INFO[BASH]}; then
        current_script=${BASH_SOURCE[0]}
    else
        current_script=${0:A}  # zsh equivalent of readlink -f
    fi

    if [[ -n $current_script && -x "$readlink_cmd" ]]; then
        script_path=$("$readlink_cmd" -f "$current_script")
        echo "$(dirname "$(dirname "$script_path")")"
    elif [[ -d "$HOME/.dotfiles" ]]; then
        echo "$HOME/.dotfiles"
    elif [[ -d "$XDG_CONFIG_HOME/dotfiles" ]]; then
        echo "$XDG_CONFIG_HOME/dotfiles"
    else
        error "Unable to find dotfiles directory"
        return 1
    fi
}

#
# Configuration Loading
#

load_dotfile() {
    local dotfile=$1
    if [[ -f "$dotfile" ]]; then
        debug "Loading $dotfile"
        # shellcheck source=/dev/null
        . "$dotfile"
    fi
}

load_dotfiles() {
    local dotfiles_dir=$1
    local os=$2

    # Core configuration files
    local core_files=(
        "function"
        "path"
        "env"
        "alias"
        "completion"
        "grep"
        "prompt"
        "custom"
        "tmux"
    )

    # Load core configuration
    for config in "${core_files[@]}"; do
        load_dotfile "$dotfiles_dir/system/.$config"
    done

    # OS-specific configuration
    if [[ "$os" == "Sequoia" ]]; then
        local darwin_files=("env.darwin" "alias.darwin" "function.darwin")
        for config in "${darwin_files[@]}"; do
            load_dotfile "$dotfiles_dir/system/.$config"
        done
    elif [[ "$os" == "Linux" ]]; then
        local linux_files=("env.linux" "alias.linux" "function.linux" "misc.linux")
        for config in "${linux_files[@]}"; do
            load_dotfile "$dotfiles_dir/system/.$config"
        done
    fi

    # Shell-specific configuration
    if ${SHELL_INFO[BASH]}; then
        for config in "$dotfiles_dir"/system/.*.bash; do
            load_dotfile "$config"
        done
    elif ${SHELL_INFO[ZSH]}; then
        for config in "$dotfiles_dir"/system/.*.zsh; do
            load_dotfile "$config"
        done
    fi
}

#
# Main
#

main() {
    # Initialize XDG Base Directory variables if not set
    export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
    export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
    export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

    # Resolve dotfiles directory
    DOTFILES_DIR=$(resolve_dotfiles_dir) || return 1

    # Load all dotfiles
    load_dotfiles "$DOTFILES_DIR" "$OS"

    # Export important variables
    export DOTFILES_DIR OS
    for shell in "${!SHELL_INFO[@]}"; do
        export "SHELL_${shell}=${SHELL_INFO[$shell]}"
    done

    # Clean up
    unset -f resolve_dotfiles_dir load_dotfile load_dotfiles debug error
}

main "$@"