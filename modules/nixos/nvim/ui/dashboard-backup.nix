{...}: {
  programs.nvf = {
    settings = {
      vim = {
        dashboard = {
          startify = {
            enable = true;
            customHeader = [
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
            ];
            customFooter = ["   Arthur Sperotto Peruzzo"];
            lists = [
              {
                type = "dir";
              }
            ];
          };
        };

        extraPlugins = {
          dashboard-image = {
            package = null;
            setup = ''
              vim.api.nvim_create_autocmd("User", {
                pattern = "StartifyReady",
                callback = function()
                  local image = require('image')
                  local img_path1 = '/home/ozzurep/arthur/cats-imgs/images/briga.png'
                  local img_path2 = '/home/ozzurep/arthur/cats-imgs/images/mari1.png'

                  vim.defer_fn(function()
                    -- First image (briga.png) on the left
                    if vim.fn.filereadable(img_path1) == 1 then
                      local img1 = image.from_file(img_path1, {
                        window = vim.api.nvim_get_current_win(),
                        buffer = vim.api.nvim_get_current_buf(),
                        -- with_virtual_padding = true,
                        x = 1,
                        y = 1,
                        width = 30,
                        height = 30,
                      })
                      if img1 then
                        img1:render()
                      end
                    end

                    -- Second image (mari1.png) on the right
                    if vim.fn.filereadable(img_path2) == 1 then
                      local img2 = image.from_file(img_path2, {
                        window = vim.api.nvim_get_current_win(),
                        buffer = vim.api.nvim_get_current_buf(),
                        -- with_virtual_padding = true,
                        x = 33,
                        y = 1,
                        width = 30,
                        height = 30,
                      })
                      if img2 then
                        img2:render()
                      end
                    end
                  end, 100)
                end,
              })
            '';
          };
        };
      };
    };
  };
}
