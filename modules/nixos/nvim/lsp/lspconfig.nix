{...}: {
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      presets.tailwindcss-language-server.enable = true;
    };

    languages = {
      typescript = {
        enable = true;
        lsp = {
          enable = true;
        };
        format = {
          enable = true;
          type = ["prettierd"];
        };
        extraDiagnostics.types = ["eslint_d"];
        treesitter = {
          enable = true;
        };
      };
      tsx = {
        enable = true;
        lsp = {
          enable = true;
        };
        format = {
          enable = true;
          type = ["prettierd"];
        };
        extraDiagnostics.types = ["eslint_d"];
        treesitter = {
          enable = true;
        };
      };
      nix.enable = true;
      go.enable = true;
      lua.enable = true;
      bash.enable = true;
      terraform.enable = true;
      # RE ADD LATER
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
