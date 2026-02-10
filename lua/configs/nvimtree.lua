local M = {}

M.on_attach = function(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvimtree " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "<leader>ee", api.tree.close, opts "close")
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "help")
end

return M
