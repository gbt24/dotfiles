# Created by newuser for 5.9
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export VISUAL=nvim
export PAGER=bat

if command -v eza &>/dev/null; then
	alias ls='eza --icons'
	alias ll='ls -alh'
	alias lh='eza -alh --sort newest --group'
else
	alias ls='ls --color=auto'
	alias lh='ls -alhrt --time-style=long-iso'
fi

alias asitop='sudo asitop'
alias mv='mv -i' # confirm override when moving
alias cp='cp -i' # confirm override when copying
alias l='less'
alias tm="tmux new -A -s main"
alias v="nvim"
alias ht='htop -u $USER'
# check usage
alias listsize='du -shc ./*'
alias dirsize='du -hs .'
alias cpu='ps -eo user,cmd:120,%cpu --sort=+%cpu'
alias mem='ps -eo user,cmd:120,%mem --sort=+%mem'
# tmux
alias tn='tmux new-session -s main'
alias ta='tmux attach'
alias tls='tmux ls'
alias tss="nvim -c \":Telescope tmux sessions quit_on_select=true\""
alias tmv='tmux rename-session -t'
alias tk='tmux kill-session -t'

alias lg="lazygit"
alias s="fastfetch"
function r() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias sr="sudo yazi"
alias c="clear"
alias setproxy="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=http://127.0.0.1:7890"
alias unsetproxy="unset ALL_PROXY"
alias grep="grep --color"
alias -s html='nvim'
alias -s txt='nvim'
alias -s md='nvim'
alias -s py='nvim'
alias -s c='nvim'
alias -s rar='rar x'
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'


eval "$(starship init zsh)"
source <(fzf --zsh)
# Open in tmux popup if on tmux, otherwise use --height mode
export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top --preview "bat --color=always {} "'
export FZF_DEFAULT_COMMAND='rg --files'
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_COMPLETION_TRIGGER='~~'
export FZF_CTRL_T_OPTS="fzf"
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'

  # Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

  # CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"


