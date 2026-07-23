{pkgs, ...}: {
  users.users.ozzurep.extraGroups = ["input"];

  services.hyprwhspr-rs = {
    enable = true;
    package = pkgs.hyprwhspr-rs.override {
      whisper-cpp = pkgs.whisper-cpp.override {cudaSupport = true;};
    };
    # environmentFile = "/path/to/hyprwhspr_secret_file"; # GROQ_API_KEY or GEMINI_API_KEY
  };
}
