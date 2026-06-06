{
  description = "AI Model Dynamic Offloader for ComfyUI";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-lib = {
      url = "github:jgus/flake-lib/v1";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, flake-lib }:
    flake-lib.lib.mkLeafFlake {
      inherit nixpkgs flake-utils;
      source = { type = "pypi"; pname = "comfy_aimdo"; format = "wheel"; };
      package = {
        attr = "comfy-aimdo";
        description = "AI Model Dynamic Offloader for ComfyUI";
      };
      pin = import ./pin.nix;
      branches = false;
    };
}
