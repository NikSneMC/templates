{
  perSystem = {naersk, ...}: {
    packages.default = naersk.buildPackage {
      src = ../.;
    };
  };
}
