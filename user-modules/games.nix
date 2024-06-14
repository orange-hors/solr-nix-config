# Configuration for enabling gaming

{ config, pkgs, ... }:

let steam-with-pkgs = pkgs.steam.override {
  extraPkgs = pkgs:
    with pkgs; [
      xorg.libXcursor
      xorg.libXi
      xorg.libXinerama
      xorg.libXScrnSaver
      libpng
      libpulseaudio
      libvorbis
      stdenv.cc.cc.lib
      libkrb5
      keyutils
      gamescope
      mangohud
    ];
  };
in {
  home.packages = [
    steam-with-pkgs
    pkgs.gamescope
    pkgs.mangohud
    pkgs.bottles
  ];
}