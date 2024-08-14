self: super: {
  python3 = super.python3.override {
    packageOverrides = python-self: python-super: {
      grep-ast = python-self.callPackage ./grep-ast.nix {};
    };
  }; 
  aider-chat = super.callPackage ./aider-chat.nix {};
}

