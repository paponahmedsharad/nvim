local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
telescope.load_extension "frecency"
telescope.load_extension "file_browser"
telescope.load_extension "harpoon"
-- telescope.load_extension "projects"

telescope.setup {
  defaults = {

    file_sorter = require("telescope.sorters").get_fzy_sorter,
    color_devicons = true,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key,
      },

      n = {
        ["<esc>"] = actions.close,
        ["jk"] = actions.close,
        ["kj"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    find_hidden = {
      hidden_files = true, -- default: false
    }, -- Your extension configuration goes here:
    file_browser = {
      theme = "ivy",
    },
  },
}

require("telescope").setup {
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "fd", -- find command (defaults to `fd`)
    },
  },
}
-- require("telescope").setup {
--   defaults = {
--     preview = {
--       mime_hook = function(filepath, bufnr, opts)
--         local is_image = function(filepath)
--           local image_extensions = { "png", "jpg", "jpeg", "gif" } -- Supported image formats
--           local split_path = vim.split(filepath:lower(), ".", { plain = true })
--           local extension = split_path[#split_path]
--           return vim.tbl_contains(image_extensions, extension)
--         end
--         if is_image(filepath) then
--           local term = vim.api.nvim_open_term(bufnr, {})
--           local function send_output(_, data, _)
--             for _, d in ipairs(data) do
--               vim.api.nvim_chan_send(term, d .. "\r\n")
--             end
--           end
--           vim.fn.jobstart({
--             "viu",
--             "-w",
--             "40",
--             "-b",
--             filepath,
--           }, {
--             on_stdout = send_output,
--             stdout_buffered = true,
--           })
--         else
--           require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
--         end
--       end,
--     },
--   },
-- }

-- -- Load extensions
require("telescope").load_extension "media_files"
