{
  # Monitor configuration
  monitor = [
    "DP-1,1920x1080@239.96Hz,0x0,1"
    # "DP-1,addreserved,0,20,20,20"
    "HDMI-1,1920x1080@60.00Hz,1920x0,1"
    # "HDMI-1,addreserved,0,20,20,20"
  ];

  # Workspace rules
  workspace = [
    "1, w[t2], monitor:DP-1, default:true, on-created-empty:kitty"
    "2, monitor:DP-1, on-created-empty:firefox"
    "3, monitor:DP-1"
    "4, monitor:DP-1"
    "5, monitor:DP-1"
    "6, monitor:DP-1"
    "7, monitor:DP-1, on-created-empty:legcord"
    "8, monitor:DP-1"
    "9, monitor:DP-1, default:false, on-created-empty:kitty"
  ];
}
