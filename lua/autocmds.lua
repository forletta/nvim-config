require "nvchad.autocmds"

-- Opens telescope when opening nvim with a directory.
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    local file = vim.fn.expand "%"

    if file == "" then
      require("nvim-tree.api").tree.open()
    end

    if vim.fn.isdirectory(file) == 1 then
      require("telescope.builtin").find_files { search_dirs = { file } }
    end
  end,
})
