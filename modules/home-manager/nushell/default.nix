{...}: {
  programs.nushell = {
    enable = true;
    envFile = {
      text = ''
        $env.FZF_DEFAULT_OPTS = "--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 --color=selected-bg:#45475A --color=border:#313244,label:#CDD6F4"
        $env.OBSIDIAN_VAULT = "/home/ozzurep/Notes/ColdNotes"
        $env.OBSIDIAN_TEMPLATES = "/home/ozzurep/Notes/ColdNotes/templates"
        $env.KITTY_LISTEN_ON = "unix:/tmp/mykitty"
        $env.COLD_NOTE_EDITOR = "nvim-zen"
        $env.BROWSER = "firefox"
        $env.EDITOR = "nvim"
        $env.APP_URL = "http://99app.local:3000"
        $env.COMPOSE_BAKE = "true"
        $env.GI_TYPELIB_PATH = "/usr/local/lib/girepository-1.0"
        $env.BUN_INSTALL = $"($env.HOME)/.bun"
        $env.NVM_DIR = $"($env.HOME)/.nvm"
        $env.PATH = ($env.PATH | split row (char esep)
          | prepend $"($env.HOME)/.local/bin"
          | prepend $"($env.HOME)/.bun/bin"
          | prepend $"($env.HOME)/.pulumi/bin"
          | prepend $"($env.HOME)/.fnm"
          | append "/usr/bin")
        load-env (fnm env --shell bash | lines | str replace 'export ' "" | str replace -a '"' "" | split column "=" | rename name value | where name != "FNM_ARCH" and name != "PATH" | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value })
        $env.PATH = ($env.PATH | prepend $"($env.FNM_MULTISHELL_PATH)/bin")
      '';
    };
    configFile = {
      text = ''
        $env.LS_COLORS = (vivid generate catppuccin-mocha)
        $env.config.show_banner = false
        $env.config.edit_mode = 'vi'
        alias ff = fzf --preview 'bat --style=numbers --color=always {}'
        alias t = tmux
        alias v = nvim +ZenMode
        alias c = clear
        alias lsa = eza -lh --group-directories-first --icons=auto -a
        alias lt = eza --tree --level=2 --long --icons --git
        alias lta = eza --tree --level=2 --long --icons --git -a
        alias ll = eza -lh --group-directories-first --icons=auto -l
        alias ld = lazydocker
        alias .. = cd ..
        alias ... = cd ../..
        alias .... = cd ../../..
        alias y = yazi
        alias nhh = nh home switch .
        alias nhs = nh os switch .
        alias nhus = nh os switch -u .
        alias za = setsid -f zathura
        alias coldnote = bun run ~/coldLab/tui/cold-note-opentui/src/index.tsx
        alias ns = nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history
        alias yayf = yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S
        def claudio [...args] { ~/.local/bin/claude ...$args }
        def cl [] { clear; magick (~/scripts/random_image.sh ~/arthur/cats-imgs/images | str trim) -resize 250x250 png:- | kitty +kitten icat --stdin yes }
        def tn [] { cd ~/Notes/ColdNotes; tmux new -s ColdNotes }
        def gitbrave [] {
          git config user.email "arthur.peruzzo@brave.ag"
          git config user.name "Arthur Peruzzo"
        }
        def gitarthur [] {
          git config user.email "peruzzoarthur@gmail.com"
          git config user.name "Arthur Sperotto Peruzzo"
        }
        if ($"($env.HOME)/.env" | path exists) {
          open $"($env.HOME)/.env"
          | lines
          | where { |l| ($l | str trim | str length) > 0 and not ($l | str starts-with "#") }
          | each { |l|
              let pair = $l | split row "=" | each { |x| $x | str trim }
              load-env { ($pair.0): ($pair | skip 1 | str join "=") }
            }
        }

          # Kitty remote control helper
       def krc [...args] {
           if "KITTY_LISTEN_ON" in $env {
               kitten @ ...$args
           } else {
               # Try to find socket
               let sockets = (ls /tmp | where name =~ "kitty-main-" | get name)
               if ($sockets | length) > 0 {
                   kitten @ --to $"unix:($sockets.0)" ...$args
               } else {
                   error make { msg: "Could not find kitty socket" }
               }
           }
         }
      '';
    };
  };
}
