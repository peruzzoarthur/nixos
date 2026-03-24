{
  # Animations
  animations = {
    enabled = true;
    bezier = [
      "myBezier, 0.05, 0.9, 0.1, 1.05"
      "bezIn, 0.5,0.0,1.0,0.5"
      "bezOut, 0.0,0.5,0.5,1.0"
    ];
    animation = [
      "windows, 1, 2, myBezier"
      "windowsOut, 1, 7, default, popin 80%"
      "border, 1, 10, default"
      "borderangle, 1, 8, default"
      # "fade, 1, 7, default"
      "fade, 1, 2, bezIn"
      "workspaces, 0, 6, default"
    ];
  };
}