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
        extraDiagnostics = {
          enable = true;
          types = ["eslint_d"];
        };
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
        extraDiagnostics = {
          enable = true;
          types = ["biomejs"];
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
      html.enable = true;
      yaml.enable = true;
      ruby = {
        enable = true;
        lsp = {
          enable = true;
          servers = ["ruby-lsp" "stimulus-language-server"];
        };
        extraDiagnostics.enable = true;
        format.enable = true;
        treesitter.enable = true;
      };
      python = {
        enable = true;
        treesitter = {
          enable = true;
        };
      };
    };
  };
}
