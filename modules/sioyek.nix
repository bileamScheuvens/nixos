{ pkgs, lib, ... }:
{
  programs.sioyek = {
    enable = true;
    package = pkgs.symlinkJoin {
      name = "sioyek-hotfix";
      paths = [ pkgs.sioyek ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/sioyek \
            --set QT_QPA_PLATFORM xcb --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ pkgs.pipewire ]}
      '';
    };
    config = {

    };
    bindings = {
      toggle_dark_mode = "td";
      toggle_custom_color = "tc";

      move_left_smooth = "h";
      move_down_smooth = "j";
      move_up_smooth = "k";
      move_right_smooth = "l";
      goto_beginning = "go";
      goto_end = "G";
      goto_definition = "gd";
      screen_down = "<C-d>";
      screen_up = "<C-u>";
      prev_state = "<C-o>";
      next_state = "<C-i>";

      quit = "<C-q>";

      # unmap ctrl w
      noop = "<C-w>";

      fit_to_page_smart = "r";
      zoom_in = "+";
      zoom_out = "-";

    };
  };

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "sioyek.desktop" ];
    "application/x-pdf" = [ "sioyek.desktop" ];
    "application/fdf" = [ "sioyek.desktop" ];
    "application/xpdf" = [ "sioyek.desktop" ];
    "application/pdx" = [ "sioyek.desktop" ];
  };

}
