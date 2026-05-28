{inputs, ...}: {
  imports = [inputs.git-hooks.flakeModule];

  perSystem.pre-commit.settings = {
    excludes = ["flake.lock"];

    hooks = {
      alejandra.enable = true;
      deadnix.enable = true;
    };
  };
}
