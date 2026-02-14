{...}: {
  programs.nvf = {
    settings = {
      config.vim = {
        startPlugins = ["image-nvim"];

        utility.images.image-nvim = {
          enable = true;
          setupOpts = {
            backend = "kitty";
            integrations.markdown.enabled = false;
          };
        };
      };
    };
  };
}
