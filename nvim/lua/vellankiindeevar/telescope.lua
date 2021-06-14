local themes = require('telescope.themes')
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require("telescope").load_extension("git_worktree")
require('telescope').load_extension('fzy_native')

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< dotfiles >",
        cwd = "~/personal/vellankiindeevar",
        winblend = 10,

    })
end

M.search_nvim = function()
    require("telescope.builtin").find_files({
        prompt_title = "< nvim >",
        cwd = "~/personal/vellankiindeevar/nvim",
        winblend = 10,

        layout_config = {
          preview_width = 0.55,

        },
    })
end

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end

M.find_files_in_directory_of_buffer = function()
  require('telescope.builtin').find_files({
      cwd = vim.fn.expand("%:p:h"),
    })
end

return M
