$env.EDITOR = "nvim"

export const ENV_DIR = ($nu.env-path | path dirname | path join env)

use $ENV_DIR os init-os-env

$env.STARSHIP_CONFIG = ($nu.home-path | path join ".config" "starship" "starship.toml")
