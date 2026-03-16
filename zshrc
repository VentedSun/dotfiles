# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

#for alias' to show up in the alias lister they need a comment.
alias p="sudo pacman" #shortens pacman
alias c='clear' #clears terminal
alias hr='hyprpm reload -n' #reloads hyprland plugins
alias ls='lsd -a' #better ls
alias list='lsd -a' #better ls
alias h='history' #history
alias i='sudo pacman -S' #install
alias u='sudo pacman -Syu' #update
alias update='sudo pacman -Syu' #update
alias updateyay='yay -Syu' #yay update
alias updatehyp='hyprpm update'
alias updateflat='flatpak update'
alias uninstall='sudo pacman -Rs' #uninstall a program
alias r='sudo pacman -Rs' #uninstall a program
alias clean='sudo pacman -R $(pacman -Qtdq)' #remove orphan packages
#alias m='rmpc'
alias copy="cp" #copy
alias move="mv" #move
alias fs="fastfetch" #load fast fetch
alias pac="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=right:75% | xargs -ro yay -S" #visual package search
alias puc="yay -Qq | fzf --multi --preview 'yay -Sii {1}' --preview-window=right:75% |  xargs -ro yay -Rns" #visual package removal (requires yay and fzf)
alias servers="cd /fast/mcservers && ls" #go to servers folder
alias servermenu="~/.scripts/servermenu.sh" #launch mc server picker
alias vsServer="/home/sun/.local/share/vintagestory/VintagestoryServer" #launch the vintage story server
alias sticks="sudo ~/.scripts/toggle-virpil.sh" #turns the virpil sticks into a controller
alias hotsupload="~/heroesprofile-uploader/bin/heroes-profile-replay-uploader --accounts-directory '~/Games/battlenet/drive_c/users/steamuser/Documents/Heroes of the Storm/Accounts/'" #uploads hots replays
alias cat="bat -p"
alias cs="cd ~/.config/quickshell/chaos-shell"
#alias bathelp='bat --plain --language=help'
#help() {
#    "$@" --help 2>&1 | bathelp
#}


alias findal='grep "^alias " ~/.zshrc | awk -F "[=]" "{split(\$0, a, \"#\"); name=\$1; sub(/^alias /, \"\", name); comment=a[length(a)]; printf \"%-15s | %s\n\", name, comment}" | column -t -s "|" | fzf --height 40% --border --header "Select alias to run" | awk "{print \$1}" | xargs -o -I {} zsh -ic "{}"' #executable and searchable alias list

bindkey "^[[2~" overwrite-mode
bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[5~" beginning-of-buffer-or-history
bindkey "^[[6~" end-of-buffer-or-history

source <(fzf --zsh) # allow for fzf history widget
bindkey '^R' fzf-history-widget

update_manager() {
    local cmds=("update" "updateyay" "updatehyp" "updateflat" "clean")

    for cmd in "${cmds[@]}"; do
        # -p prints the prompt string
        # -r prevents backslash escaping
        # -k 1 reads exactly one character
        echo -n "Run '$cmd'? [y/N]: "
        read -r -k 1 response
        echo "" # Move to a new line after the keypress

        if [[ "$response" =~ ^[Yy]$ ]]; then
            echo "--- Executing: $cmd ---"
            # eval forces the shell to look up aliases, functions, or binaries
            eval "$cmd"
        else
            echo "Skipping: $cmd"
        fi
        echo "--------------------------"
    done

    echo "Sequence complete."
}

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
# -------------------------------------------------------------------
# History Configuration
# -------------------------------------------------------------------

# Location where history is saved.
HISTFILE=~/.zsh_history
# Number of history lines to keep in memory for the current session.
HISTSIZE=10000
# Number of history lines to save to the history file.
SAVEHIST=10000
# Don't save duplicate commands in a row.
setopt HIST_IGNORE_DUPS
# When searching history, don't display duplicates.
setopt HIST_FIND_NO_DUPS
# Ignore commands that start with a space.
setopt HIST_IGNORE_SPACE
# Append commands to the history file as they are executed, rather than waiting for the shell to exit.
setopt INC_APPEND_HISTORY
# Share history instantly among all running zsh sessions.
setopt SHARE_HISTORY

eval "$(starship init zsh)"

fs
