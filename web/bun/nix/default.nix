{inputs, ...}: {
  imports = [
    ./package.nix
    ./shell.nix
  ];

  perSystem = {system, ...}: {
    _module.args = let
      pkgs = import inputs.nixpkgs {
        inherit system;
      };
    in {
      inherit pkgs;
    };
  };
}
