{...}: {
  programs.zsh = {
    enable = true;
    
    # Zsh plugins via home-manager
    zplug = {
      enable = true;
      plugins = [
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "Aloxaf/fzf-tab"; }
      ];
    };
    
    # Oh My Zsh configuration
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "archlinux" "aws" "kubectl" "kubectx" "command-not-found" ];
    };
    
    # History configuration
    history = {
      size = 5000;
      save = 5000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      ignoreSpace = true;
      extended = true;
      share = true;
    };
    
    shellAliases = {
      # Basic ls aliases
      ls = "eza -lh --group-directories-first --icons=auto";
      lsa = "ls -a";
      lt = "eza --tree --level=2 --long --icons --git";
      lta = "lt -a";
      ll = "ls -l";
      
      # Utility aliases
      ff = "fzf --preview 'bat --style=numbers --color=always {}'";
      t = "tmux";
      tn = "cd ~/Notes/ColdNotes && tmux new -s ColdNotes";
      v = "nvim +ZenMode";
      c = "clear";
      cl = "clear && magick \"$(~/scripts/random_image.sh ~/arthur/cats-imgs/images)\" -resize 250x250 png:- | kitty +kitten icat --stdin yes";
      yayf = "yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S";
      ld = "lazydocker";
      
      # Directory navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      
      # Git config aliases
      gitbrave = "git config user.email \"arthur.peruzzo@brave.ag\" && git config user.name \"Arthur Peruzzo\"";
      gitarthur = "git config user.email \"peruzzoarthur@gmail.com\" && git config user.name \"Arthur Sperotto Peruzzo\"";
    };
    
    # Key bindings
    defaultKeymap = "emacs";
    initContent = ''
      # Disable Powerlevel10k instant prompt
      typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
      
      # Custom key bindings
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
      bindkey '^[w' kill-region
      
      # Setup bindings for both smkx and rmkx key variants
      # Home
      bindkey '\e[H'  beginning-of-line
      bindkey '\eOH'  beginning-of-line
      # End
      bindkey '\e[F'  end-of-line
      bindkey '\eOF'  end-of-line
      # Left
      bindkey '\e[D' backward-char
      bindkey '\eOD' backward-char
      # Right
      bindkey '\e[C' forward-char
      bindkey '\eOC' forward-char
      # Delete
      bindkey '\e[3~' delete-char
      # Backspace
      bindkey '\e?' backward-delete-char
      # PageUp
      bindkey '\e[5~' up-line-or-history
      # PageDown
      bindkey '\e[6~' down-line-or-history
      # Ctrl+Left
      bindkey '\e[1;5D' backward-word
      # Ctrl+Right
      bindkey '\e[1;5C' forward-word
      # Shift+Tab
      bindkey '\e[Z' reverse-menu-complete
      
      # Load Powerlevel10k config if it exists
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      
      # Fastfetch on startup
      # if [ -f /usr/bin/fastfetch ]; then
        # fastfetch
      # fi
      
      # CLI colors
      export CLICOLOR=1
      export LS_COLORS='di=1;36:ln=1;35:ex=1;32:so=1;31:pi=1;33:bd=1;34:cd=1;33:su=0;41:sg=0;46:tw=0;42:ow=0;43'
      
      # Completion styling
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
      
      # Environment variables
      export BAT_THEME="Catppuccin Mocha"
      export FZF_DEFAULT_OPTS=" \
      --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
      --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
      --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
      --color=selected-bg:#45475A \
      --color=border:#313244,label:#CDD6F4"
      
      export OBSIDIAN_VAULT="/home/ozzurep/Notes/ColdNotes"
      export OBSIDIAN_TEMPLATES="/home/ozzurep/Notes/ColdNotes/templates"
      export COLD_NOTE_EDITOR="nvim-zen"
      export BROWSER=firefox
      export EDITOR=nvim
      export APP_URL="http://99app.local:3000"
      export COMPOSE_BAKE=true
      export GI_TYPELIB_PATH=/usr/local/lib/girepository-1.0:$GI_TYPELIB_PATH
      
      # PATH additions
      export PATH="$PATH:/usr/bin/"
      export PATH="$PATH:/home/ozzurep/.local/bin"
      export PATH="$PATH:/home/ozzurep/.pulumi/bin"
      export PATH="$HOME/.rbenv/bin:$PATH"
      export PATH="$HOME/.bun/bin:$PATH"
      export BUN_INSTALL="$HOME/.bun"
      
      # Shell integrations
      eval "$(zoxide init zsh | sed 's/zi()/zoxide_zi()/')"
      source <(fzf --zsh)
      eval "$(rbenv init -)"
      
      # Atuin integration
      [[ -f "$HOME/.atuin/bin/env" ]] && source "$HOME/.atuin/bin/env"
      eval "$(atuin init zsh --disable-up-arrow)"
      
      # Vi mode
      set -o vi
      
      # NVM setup
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
      nvm use 22 > /dev/null
      
      # Cargo environment
      [[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
      
      # Deno environment
      [[ -f "$HOME/.deno/env" ]] && source "$HOME/.deno/env"
      
      # Terraform completion
      autoload -U +X bashcompinit && bashcompinit
      complete -o nospace -C /usr/local/bin/terraform terraform
      
      # Function path and completions
      fpath+=~/.zfunc
      autoload -Uz compinit && compinit
      
      # Import .env variables
      if [ -f "$HOME/.env" ]; then
        export $(cat $HOME/.env | xargs)
      fi
      
      # Custom functions
      ccm() {
        git diff | cody chat --stdin -m 'Write a commit message for this diff'
      }
      
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d ''' cwd < "$tmp"
        [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
        rm -f -- "$tmp"
      }
    '';
  };
}
