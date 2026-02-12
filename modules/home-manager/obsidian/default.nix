
{...}: {
  programs.obsidian = {
    enable = true;
    vaults = {
      ColdNotes = {
        target = "/Notes/ColdNotes/";
      };
    };
  };
}
