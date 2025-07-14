export def init-os-env [] {
	use std

	match $nu.os-info.name {
		"macos" => {
			with-env { PATH: $env.PATH } {
				std path add '~/bin'
				std path add '~/.local/bin'
				std path add '~/.cargo/bin'
        std path add '/usr/local/go/bin'
        std path add --append '~/.pyenv/shims'
        std path add --append '~/.pyenv/bin'
				{
					PATH: $env.PATH
				}
			}
		}
		"linux" => {
			with-env { PATH: $env.PATH } {
				std path add '~/bin'
				std path add --append '~/.cargo/bin'
        std path add --append '/usr/local/go/bin'
        std path add --append '~/.pyenv/shims'
        std path add --append '~/.pyenv/bin'
				{
					PATH: $env.PATH
				}
			}
		}
		_ => {
			{
				PATH: $env.PATH
			}
		}
	}
}
