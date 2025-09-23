{...}: {
  programs.firefox = {
    enable = true;
    preferences = {
      "ui.systemUsesDarkTheme" = 1;
      "browser.theme.content-theme" = 0; # 0 = auto (dark), 1 = light, 2 = dark
      "browser.theme.toolbar-theme" = 0; # 0 = auto (dark), 1 = light, 2 = dark
      "font.name.monospace.x-western" = "JetBrains Mono";
      "font.name.sans-serif.x-western" = "JetBrains Mono";
      "font.name.serif.x-western" = "JetBrains Mono";
    };
  };
}
