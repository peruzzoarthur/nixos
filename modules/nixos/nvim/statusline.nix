{...}: {
  programs.nvf = {
    settings = {
      vim.statusline.lualine = {
        enable = true;
        theme = "catppuccin";
        activeSection = {
          z = [
            ''
            {
              "",
              draw_empty = true,
              separator = { left = '', right = '' }
            }
          ''
            ''
            {
              "progress",
              separator = {left = ''}
            }
          ''
            ''
            {"location"}
          ''
            ''
            {
              "fileformat",
                color = {fg='black'},
                symbols = {
                  unix = '󱄅 ', -- e712
                    dos = '',  -- e70f
                    mac = '',  -- e711
                }
            }
          ''
            ];
        };
      };
    };
  };
}
