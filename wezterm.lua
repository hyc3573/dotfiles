local wezterm = require 'wezterm'
return {
	color_scheme = "nord",
	font = wezterm.font("FiraCode Nerd Font"),
	use_ime = true,
	enable_tab_bar = false,
	window_background_opacity = 0.5,
	check_for_updates = false,
	skip_close_confirmation_for_processes_named = {
		"bash", "sh", "zsh", "fish", "tmux", "vim", "emacsclient", "emacs"
	},
	window_padding = {top = "0cell", left = "0cell", right = "0cell", bottom = "0cell"}
}
