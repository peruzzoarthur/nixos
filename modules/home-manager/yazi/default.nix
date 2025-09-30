{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      log = {
        enabled = false;
      };
      mgr = {
        ratio = [2 4 2];
        show_hidden = false;
        sort_by = "mtime";
        sort_dir_first = true;
        sort_reverse = true;
      };
    };
    flavors = {
      catppuccin-mocha = ./catppuccin-mocha;
    };
    # theme = {
    #   filetype = {
    #     rules = [
    #       {
    #         name = "*/";
    #         fg = "#FFFFFF";
    #       }
    #       {
    #         fg = "#7AD9E5";
    #         mime = "image/*";
    #       }
    #       {
    #         fg = "#F3D398";
    #         mime = "video/*";
    #       }
    #       {
    #         fg = "#F3D398";
    #         mime = "audio/*";
    #       }
    #       {
    #         fg = "#CD9EFC";
    #         mime = "application/bzip";
    #       }
    #     ];
    #   };
    # };
  };
}
