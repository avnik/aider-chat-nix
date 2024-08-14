{
    inputs = {
        flake-parts = {
            url = "github:hercules-ci/flake-parts";
            inputs.nixpkgs-lib.follows = "nixpkgs";
        };
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    outputs = inputs@{ flake-parts, nixpkgs, ...}:
        flake-parts.lib.mkFlake
        { inherit inputs; }
        {
            systems = [
                "x86_64-linux"
                "aarch64-linux"
            ];

            perSystem = { system, pkgs, ...}: {
                packages = {
                    default = let 
                        aiderPython = pkgs.python312.override {
                            packageOverrides = python-self: python-super: {
                                grep-ast = python-self.callPackage ./grep-ast.nix {};
                                tree-sitter = builtins.trace "FIXED" python-super.tree-sitter_0_21;
                                tree-sitter-languages = builtins.trace "FIXXXED" python-super.tree-sitter-languages.override { tree-sitter = builtins.trace "${python-super.tree-sitter_0_21.version}" python-super.tree-sitter_0_21; };
                            };
                        };
                        aider-chat = aiderPython.pkgs.callPackage ./aider-chat.nix {};
                        in aider-chat;
                };
            };
                python3Packages = aiderPython.pkgs;
                aider-chat = aiderPython.pkgs.callPackage ./aider-chat.nix { inherit python3Packages; };
        };
}
