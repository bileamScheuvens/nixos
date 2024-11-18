
{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
  programs.hyprland.enable = true;
  programs.waybar.enable = true;
}
