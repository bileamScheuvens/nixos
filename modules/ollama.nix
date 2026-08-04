{ pkgs, ... }:
{

  # environment.systemPackages = with pkgs; [
  #   oterm
  # ];
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
    environmentVariables = {
      OLLAMA_NO_CLOUD = "1";
    };
  };
}
