{ lib
, python3Packages
, openai
, fetchFromGitHub
}:

python3Packages.buildPythonApplication rec {
  pname = "aider-chat";
  version = "0.49.0";  # Replace with the latest version

  src = fetchFromGitHub {
    owner = "paul-gauthier";
    repo = "aider";
    rev = "v${version}";  # Use a specific tag/version
    # rev = "main";  # Uncomment this and comment out the line above to use the latest commit from main branch
    sha256 = "sha256-zfHsEpwGmAvXPXBbCnzwdTHMZpRdk9V4W2DNu13pgqQ=";  # Replace with the actual SHA256
  };


  patches = [
    # ./aider-openai-import.patch
  ];


  propagatedBuildInputs = with python3Packages; [
    anthropic
    openai
    tiktoken
    prompt-toolkit
    pygments
    rich
    gitpython
    backoff
    diskcache
    yaspin
    pytest
    configargparse
    jsonschema
    python-dotenv
    pillow
    pyperclip
    importlib-resources
    pypandoc
    grep-ast
  ];

  doCheck = false;  # Disable tests if they're not readily available

  meta = with lib; {
    description = "Aider is an AI pair programming tool";
    homepage = "https://github.com/paul-gauthier/aider";
    license = licenses.mit;
    maintainers = with maintainers; [ ];  # Add maintainers if known
  };
}

