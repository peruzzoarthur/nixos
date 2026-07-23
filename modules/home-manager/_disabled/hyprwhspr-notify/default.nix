{config, pkgs, ...}: let
  transcriptFile = "${config.xdg.dataHome}/hyprwhspr-rs/transcriptions.json";
  notify = pkgs.writeShellScript "hyprwhspr-notify" ''
    text="$(${pkgs.jq}/bin/jq -r '.[0].text // empty' "${transcriptFile}")"
    [ -n "$text" ] || exit 0
    ${pkgs.libnotify}/bin/notify-send --app-name=hyprwhspr-rs --icon=audio-input-microphone "Dictation" "$text"
  '';
in {
  systemd.user.services.hyprwhspr-notify = {
    Unit.Description = "Show hyprwhspr-rs transcriptions";
    Service = {
      Type = "oneshot";
      ExecStart = notify;
    };
  };

  systemd.user.paths.hyprwhspr-notify = {
    Path = {
      Unit = "hyprwhspr-notify.service";
      PathChanged = transcriptFile;
    };
    Install.WantedBy = ["default.target"];
  };
}
