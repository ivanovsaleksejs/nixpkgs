# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, HUnit, parsec, prettyclass, testFramework
, testFrameworkHunit
}:

cabal.mkDerivation (self: {
  pname = "language-glsl";
  version = "0.1.0";
  sha256 = "0jr6jwxsfpmnjrnaary37s2i47akq665fnyvv37cp6j928srjizf";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ parsec prettyclass ];
  testDepends = [
    HUnit parsec prettyclass testFramework testFrameworkHunit
  ];
  meta = {
    description = "GLSL abstract syntax tree, parser, and pretty-printer";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
