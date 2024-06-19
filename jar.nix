{ pkgs ? import <nixpkgs> {} }:

pkgs.mkDerivation {
  pname = "my-java-app";
  version = "1.0";
  src = ./path/to/your/app;

  buildInputs = [ pkgs.openjdk ];
  buildPhase = ''
    javac -d . src/com/example/Main.java
    jar cvfe app.jar com.example.Main com/example/*.class
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp app.jar $out/bin/
  '';
}
