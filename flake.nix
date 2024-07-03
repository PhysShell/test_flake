{
  description = "A basic flake for hello world";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

defaultPackage.x86_64-linux =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "hello";
        src = self;
        buildPhase = "gcc -o hello ./hello.c";
        installPhase = "mkdir -p $out/bin; install -t $out/bin hello";
      };
#    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

#    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
