$env.EDITOR = "nvim"

$env.STARSHIP_CONFIG = ($nu.home-path | path join ".config" "starship" "starship.toml")

def --env activate-venv [] {
  let venv_path = (pwd | path join ".venv/bin")
  $env.PATH = ($env.PATH | prepend $venv_path)
  $env.VIRTUAL_ENV = (pwd | path join ".venv")
}

# Enable path helpers
use std "path add"

# Add OS-specific paths
match $nu.os-info.name {
  "macos" => {
    for p in [
      ($nu.home-path | path join "bin")
      ($nu.home-path | path join ".local" "bin")
      ($nu.home-path | path join ".cargo" "bin")
      "/opt/homebrew/bin"
      "/usr/local/go/bin"
    ] {
      path add $p
    }
  }
  "linux" => {
    for p in [
      ($nu.home-path | path join "bin")
      ($nu.home-path | path join ".cargo" "bin")
      "/usr/local/go/bin"
      ($nu.home-path | path join ".pyenv" "shims")
      ($nu.home-path | path join ".pyenv" "bin")
    ] {
      path add $p
    }
  }
  _ => {}  # fallback for unsupported OS
}

# Optional: ENV_CONVERSIONS to fix path issues with external commands
$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
    to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
  }
}

