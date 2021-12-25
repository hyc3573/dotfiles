local wezterm = require 'wezterm'
return {
	color_scheme = "nord",
	font = wezterm.font("FiraCode Nerd Font"),
	use_ime = true,
	enable_tab_bar = false,
	window_background_opacity = 0.5,
	ratelimit_output_bytes_per_second = 400000,
}
