{...}: {
  programs.nushell = {
    enable = true;
    configFile = {
      text = ''
        $env.LS_COLORS = (vivid generate catppuccin-mocha)
        $env.config.show_banner = false
        $env.config.edit_mode = 'vi'
        alias ff = fzf --preview 'bat --style=numbers --color=always {}'
        alias t = tmux
        alias v = nvim +ZenMode
        alias c = clear
        alias ll = eza -lh --group-directories-first --icons=auto -l
        alias ld = lazydocker
        alias .. = cd ..
        alias ... = cd ../..
        alias .... = cd ../../..
        def cl [] { clear; magick (~/scripts/random_image.sh ~/arthur/cats-imgs/images | str trim) -resize 250x250 png:- | kitty +kitten icat --stdin yes }
       '';
     };
  };
}
