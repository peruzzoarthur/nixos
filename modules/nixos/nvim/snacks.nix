{...}: {
  programs.nvf = {
    settings = {
      vim.utility.snacks-nvim = {
        enable = true;
        setupOpts = {
          bigfile = {enabled = true;};
          dashboard = {enabled = true;};
          explorer = {enabled = true;};
          indent = {enabled = true;};
          input = {enabled = true;};
          picker = {enabled = true;};
          notifier = {enabled = true;};
          quickfile = {enabled = true;};
          scope = {enabled = true;};
          scroll = {enabled = true;};
          statuscolumn = {enabled = true;};
          words = {enabled = true;};
        };
      };
    };
  };
}
