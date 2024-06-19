{
  description = "My flake Templates";
  outputs =
    { self }:
    {
      templates = {
        rust = {
          path = ./rust;
          description = "Basic Rust Nix project";
        };
        kotlin = {
          path = ./kotlin;
          description = "Basic Kotlin application Nix project";
        };
      };
    };
}
