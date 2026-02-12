{...}: {
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
    };

    languages = {
      ts = {
        enable = true;
        format = {
          enable = true;
          type = ["prettierd"];
        };
        treesitter = {
          enable = true;
        };
      };
      nix.enable = true;
      go.enable = true;
      lua.enable = true;
      bash.enable = true;
      terraform.enable = true;
      tailwind.enable = true;
      # RE ADD LATER
      html.enable = false;
      yaml.enable = true;
      python = {
        enable = true;
        treesitter = {
          enable = true;
        };
      };
    };
  };
}
