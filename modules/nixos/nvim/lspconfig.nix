{...}: {
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
    };

    # Language-specific configurations
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
      html.enable = true;
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
