{pkgs, ...}: {
  environment.sessionVariables = {
    TERMINAL = "kitty";
    BROWSER = "firefox";
    EDITOR = "nvim";
    COMPOSE_BAKE = "true";
    DOCKER_BUILDKIT = "1";
    PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
    PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = "1";
    PUPPETEER_EXECUTABLE_PATH = "${pkgs.chromium}/bin/chromium";
    PUPPETEER_SKIP_DOWNLOAD = "1";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
  };
}
