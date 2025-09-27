{...}: {
  programs.nvf = {
    settings = {
      config.vim = {
        startPlugins = ["image-nvim"];

        utility.images.image-nvim = {
          enable = true;
          setupOpts = {
            backend = "kitty";
            integrations.markdown.enabled = true;
          };
        };

        # extraPlugins = {
        #   zen-mode = {
        #     package = pkgs.vimPlugins.zen-mode-nvim;
        #     setup = ''
        #       require('zen-mode').setup({
        #         window = {
        #           backdrop = 0.95,
        #           width = 120,
        #           height = 1,
        #         },
        #       })
        #     '';
        #   };
        # };
        #
        # maps.normal."<leader>z" = {
        #   action = ":ZenMode<CR>";
        #   desc = "Toggle Zen Mode";
        # };
      };
    };
  };
}
