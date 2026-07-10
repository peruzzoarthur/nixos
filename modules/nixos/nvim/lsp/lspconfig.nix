{lib, ...}: {
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      presets.tailwindcss-language-server.enable = true;
    };

    # ponytail: ruby module hardcodes rubocop for eruby, which can't parse ERB
    # and emits bogus "regexp/<" syntax errors. Lint .erb with erb_lint instead
    # (nvim-lint builtin runs `bundle exec erblint`, uses the project's gem).
    diagnostics.nvim-lint.linters_by_ft.eruby = lib.mkForce ["erb_lint"];

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
