{pkgs, ...}:
{
programs.nvf = {
  settings = {
  config.vim.lazy.plugins = {
    "nvim-lspconfig" = {
      package = pkgs.vimPlugins.nvim-lspconfig;
      # after = ''
      #   local lspconfig = require("lspconfig")
      #
      #   local capabilities = require("cmp_nvim_lsp").default_capabilities()
      #       or vim.lsp.protocol.make_client_capabilities()
      #
      #   local on_attach = function(client, bufnr)
      #       -- Enable completion triggered by <c-x><c-o>
      #       vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      #   end
      #
      #   -- TypeScript/JavaScript LSP with vtsls
      #   lspconfig.vtsls.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/vtsls", "--stdio" },
      #       root_dir = function(fname)
      #           local deno_root = lspconfig.util.root_pattern("deno.json", "deno.jsonc")(fname)
      #           if deno_root then
      #               return nil -- Don't start vtsls in Deno projects
      #           end
      #           return lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json")(fname)
      #       end,
      #       single_file_support = false,
      #       on_attach = function(client, bufnr)
      #           local filename = vim.api.nvim_buf_get_name(bufnr)
      #           if filename:match("%.env") or filename:match("%.env%.") then
      #               vim.diagnostic.disable(bufnr)
      #           end
      #           on_attach(client, bufnr)
      #       end,
      #       init_options = {
      #           hostInfo = "neovim",
      #           preferences = {
      #               includeCompletionsForModuleExports = true,
      #               includeCompletionsForImportStatements = true,
      #               importModuleSpecifierPreference = "relative",
      #               importModuleSpecifier = "relative",
      #               includeInlayParameterNameHints = "all",
      #               includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      #               includeInlayFunctionParameterTypeHints = true,
      #               includeInlayVariableTypeHints = true,
      #               includeInlayPropertyDeclarationTypeHints = true,
      #               includeInlayFunctionLikeReturnTypeHints = true,
      #               includeInlayEnumMemberValueHints = true,
      #           },
      #       },
      #       settings = {
      #           typescript = {
      #               inlayHints = {
      #                   includeInlayParameterNameHints = "all",
      #                   includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      #                   includeInlayFunctionParameterTypeHints = true,
      #                   includeInlayVariableTypeHints = true,
      #                   includeInlayPropertyDeclarationTypeHints = true,
      #                   includeInlayFunctionLikeReturnTypeHints = true,
      #                   includeInlayEnumMemberValueHints = true,
      #               },
      #               preferences = {
      #                   importModuleSpecifier = "non-relative",
      #                   includeCompletionsForModuleExports = true,
      #                   includeCompletionsForImportStatements = true,
      #                   importModuleSpecifierPreference = "non-relative",
      #               },
      #           },
      #           javascript = {
      #               inlayHints = {
      #                   includeInlayParameterNameHints = "all",
      #                   includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      #                   includeInlayFunctionParameterTypeHints = true,
      #                   includeInlayVariableTypeHints = true,
      #                   includeInlayPropertyDeclarationTypeHints = true,
      #                   includeInlayFunctionLikeReturnTypeHints = true,
      #                   includeInlayEnumMemberValueHints = true,
      #               },
      #               preferences = {
      #                   importModuleSpecifier = "non-relative",
      #               },
      #           },
      #       },
      #   })
      #
      #   -- ESLint LSP
      #   lspconfig.eslint.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/vscode-eslint-language-server", "--stdio" },
      #       filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      #       on_attach = function(client, bufnr)
      #           local filename = vim.api.nvim_buf_get_name(bufnr)
      #           if filename:match("%.env") or filename:match("%.env%.") then
      #               vim.diagnostic.disable(bufnr)
      #               return
      #           end
      #       end,
      #       root_dir = lspconfig.util.root_pattern(
      #           ".eslintrc",
      #           ".eslintrc.js",
      #           ".eslintrc.cjs",
      #           ".eslintrc.yaml",
      #           ".eslintrc.yml",
      #           ".eslintrc.json",
      #           "eslint.config.js",
      #           "package.json"
      #       ),
      #       settings = {
      #           codeAction = {
      #               disableRuleComment = {
      #                   enable = true,
      #                   location = "separateLine",
      #               },
      #               showDocumentation = {
      #                   enable = true,
      #               },
      #           },
      #           codeActionOnSave = {
      #               enable = false,
      #               mode = "all",
      #           },
      #           experimental = {
      #               useFlatConfig = false,
      #           },
      #           format = true,
      #           nodePath = "",
      #           onIgnoredFiles = "off",
      #           packageManager = "npm",
      #           problems = {
      #               shortenToSingleLine = false,
      #           },
      #           quiet = false,
      #           rulesCustomizations = {},
      #           run = "onType",
      #           useESLintClass = false,
      #           validate = "on",
      #           workingDirectory = {
      #               mode = "location",
      #           },
      #       },
      #   })
      #
      #   -- Tailwind CSS LSP
      #   lspconfig.tailwindcss.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/tailwindcss-language-server", "--stdio" },
      #       filetypes = { "typescriptreact", "javascriptreact", "typescript", "javascript", "html", "css" },
      #       init_options = {
      #           userLanguages = {
      #               typescriptreact = "javascript",
      #               javascriptreact = "javascript",
      #           },
      #       },
      #       root_dir = lspconfig.util.root_pattern(
      #           "tailwind.config.js",
      #           "tailwind.config.ts",
      #           "postcss.config.js",
      #           "package.json"
      #       ),
      #   })
      #
      #   -- CSS LSP
      #   lspconfig.cssls.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/vscode-css-language-server", "--stdio" },
      #       settings = {
      #           css = {
      #               validate = false,
      #               lint = {
      #                   unknownAtRules = "ignore",
      #                   validProperties = {},
      #               },
      #           },
      #           scss = {
      #               validate = false,
      #               lint = {
      #                   unknownAtRules = "ignore",
      #               },
      #           },
      #       },
      #       on_attach = function(client, bufnr)
      #           local filename = vim.api.nvim_buf_get_name(bufnr)
      #           if filename:match("styles/theme/") or filename:match("source%-inline%.css") then
      #               vim.diagnostic.disable(bufnr)
      #           end
      #       end,
      #   })
      #
      #   -- JSON LSP
      #   lspconfig.jsonls.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/vscode-json-language-server", "--stdio" },
      #   })
      #
      #   -- Bash LSP
      #   lspconfig.bashls.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/bash-language-server", "start" },
      #   })
      #
      #   -- YAML LSP
      #   lspconfig.yamlls.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/yaml-language-server", "--stdio" },
      #   })
      #
      #   -- Ruby LSP (if available)
      #   lspconfig.solargraph.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/solargraph", "stdio" },
      #   })
      #
      #   -- HTML LSP
      #   lspconfig.html.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/vscode-html-language-server", "--stdio" },
      #   })
      #
      #   -- Lua LSP
      #   lspconfig.lua_ls.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/lua-language-server" },
      #   })
      #
      #   -- Nix LSP
      #   lspconfig.nil_ls.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/nil" },
      #   })
      #
      #   -- Go LSP
      #   lspconfig.gopls.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/gopls" },
      #   })
      #
      #   -- Docker LSP
      #   lspconfig.dockerls.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/docker-langserver", "--stdio" },
      #   })
      #
      #   -- Prisma LSP
      #   lspconfig.prismals.setup({
      #       capabilities = capabilities,
      #       cmd = { "/run/current-system/sw/bin/prisma-language-server", "--stdio" },
      #   })
      #
      #   -- Deno LSP
      #   lspconfig.denols.setup({
      #       capabilities = capabilities,
      #       root_dir = function(fname)
      #           local root_pattern = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
      #           local found = root_pattern(fname)
      #           if found then
      #               return found
      #           else
      #               return nil -- explicitly disable denols if no Deno config is found
      #           end
      #       end,
      #       single_file_support = false,
      #       on_attach = function(client, bufnr)
      #           -- Disable vtsls if denols is active
      #           local clients = vim.lsp.get_clients({ bufnr = bufnr })
      #           for _, c in ipairs(clients) do
      #               if c.name == "vtsls" then
      #                   c.stop()
      #               end
      #           end
      #           on_attach(client, bufnr)
      #       end,
      #   })
      #
      #   -- Keymaps for LSP functionality
      #   vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      #   vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      #   vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      #   vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      #   vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      #   vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
      #   vim.api.nvim_set_keymap(
      #       "n",
      #       "<leader>oi",
      #       '<cmd>lua vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })<CR>',
      #       { noremap = true, silent = true }
      #   )
      # '';
      #
      # event = ["BufReadPre"];

      keys = [
        {
          key = "K";
          action = ":lua vim.lsp.buf.hover()<CR>";
          mode = "n";
          desc = "LSP Hover";
        }
        {
          key = "<leader>gd";
          action = ":lua vim.lsp.buf.definition()<CR>";
          mode = "n";
          desc = "Go to definition";
        }
        {
          key = "<leader>gr";
          action = ":lua vim.lsp.buf.references()<CR>";
          mode = "n";
          desc = "Go to references";
        }
        {
          key = "<leader>ca";
          action = ":lua vim.lsp.buf.code_action()<CR>";
          mode = "n";
          desc = "Code action";
        }
        {
          key = "<leader>rn";
          action = ":lua vim.lsp.buf.rename()<CR>";
          mode = "n";
          desc = "Rename";
        }
        {
          key = "<space>rn";
          action = ":lua vim.lsp.buf.rename()<CR>";
          mode = "n";
          desc = "Rename";
        }
        {
          key = "<leader>oi";
          action = ":lua vim.lsp.buf.code_action({ context = { only = { \"source.organizeImports\" } }, apply = true })<CR>";
          mode = "n";
          desc = "Organize imports";
        }
      ];
    };
  };
  };
 };
}
