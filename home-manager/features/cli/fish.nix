{pkgs, ...}: {
  programs.fish = {
    enable = true;
    catppuccin.enable = true;
    functions = {
      # Disable greeting https://fishshell.com/docs/current/language.html#envvar-fish_greeting
      fish_greeting = "";
    };
  };
}
