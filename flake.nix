{
  description = "My flake Templates";
  outputs = { self }: {
    templates = {
      rust = {
        path = ./rust;
        description = "Basic Rust Nix project";
      };
    };
  };
}
