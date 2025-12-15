{...}: {
  programs.nvf = {
    settings = {
      vim = {
        dashboard = {
          startify = {
            enable = true;
            changeToDir = false;
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
          startify-cats = {
            package = null;
            setup = ''
              local startify_cats = dofile('${./startify-cats.lua}')
              startify_cats.setup()
            '';
          };
        };
      };
    };
  };
}
