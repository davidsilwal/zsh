# ~/.config/zsh/.zshenv

# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

# ---------- Pager ----------
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="batcat -l man -p"
fi

# ---------- GPG ----------
# Only set when a terminal is attached; `tty` prints the literal string
# "not a tty" otherwise, which breaks gpg-agent in scripts and cron.
if [[ -t 0 ]]; then
    export GPG_TTY=$(tty)
fi

# ---------- Starship ----------
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"

# ---------- PATH ----------
# Personal binaries/scripts
export PATH="$HOME/.local/bin:$PATH"

# Rust toolchain (rustup). Guarded, because not every machine has cargo and
# an unguarded `.` would error on every shell start.
if [[ -r "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi
