{ lib
, python3Packages
, fetchFromGitHub
}:

python3Packages.buildPythonPackage rec {
  pname = "grep-ast";
  version = "unstable-2023-08-13"; # Replace with the date of the latest commit you want to use

  src = fetchFromGitHub {
    owner = "paul-gauthier";
    repo = "grep-ast";
    rev = "main"; # You can replace this with a specific commit hash if you want
    sha256 = "sha256-vrkplkOZdBYibbEK0pYPvVU/AQ6+d8BX6KcUWA8aX1o="; # Replace with the correct hash
  };

  # If there are any build dependencies, add them here
  buildInputs = with python3Packages; [
    # Add any necessary build dependencies
  ];

  # Add runtime dependencies
  propagatedBuildInputs = with python3Packages; [
    # Add any necessary runtime dependencies
    # You may need to check the repository's setup.py or requirements.txt for these
  ];

  # Disable tests if they're not available or not working
  doCheck = false;

  # This ensures the package is treated as a Python module
  format = "setuptools";

  meta = with lib; {
    description = "Grep through Python Abstract Syntax Trees";
    homepage = "https://github.com/paul-gauthier/grep-ast";
    license = licenses.mit; # Adjust if the license is different
    maintainers = with maintainers; [ ]; # Add maintainers if known
  };
}
