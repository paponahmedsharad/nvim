local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
	return
end

--> setup
neotree.setup({
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_diagnostics = false,
	default_component_configs = {
		indent = {
			padding = 1,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			-- expander config, needed for nesting files
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
			default = "",
		},
		git_status = {
			symbols = {
				added = "",
				deleted = "",
				modified = "",
				renamed = "➜",
				untracked = "★",
				ignored = "◌",
				unstaged = "✗",
				staged = "✓",
				conflict = "",
			},
		},
	},
	window = {
		position = "left",
		width = 25,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["o"] = "open",
			["w"] = "open_with_window_picker",
		},
	},
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = true,
			hide_gitignored = false,
			hide_by_name = {
				".DS_Store",
				"thumbs.db",
				"node_modules",
				"__pycache__",
			},
		},
		follow_current_file = false,
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
	},
	git_status = {
		window = {
			position = "float",
		},
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function(_)
				vim.opt_local.signcolumn = "auto"
			end,
		},
	},
})
