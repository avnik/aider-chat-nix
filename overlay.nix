self: super: {
  python3 = super.python3.override {
    packageOverrides = python-self: python-super: {
      grep-ast = python-self.callPackage ./grep-ast.nix {};
      tree-sitter-languages = python-super.tree-sitter-languages { tree-sitter = python-super.tree-sitter_0_21; };
    };
  }; 
  aider-chat = super.callPackage ./aider-chat.nix {};
}

