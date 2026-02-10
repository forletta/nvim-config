local nvchadlsp = require "nvchad.configs.lspconfig"
local map = vim.keymap.set

nvchadlsp.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  -- go to:
  map("n", "<leader>lgD", vim.lsp.buf.declaration, opts "go to declaration")
  map("n", "<leader>lgd", vim.lsp.buf.definition, opts "go to definition")
  map("n", "<leader>lgt", vim.lsp.buf.type_definition, opts "go to type definition")

  -- workspace
  map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts "add workspace folder")
  map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts "remove workspace folder")
  map("n", "<leader>lwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>lr", require "nvchad.lsp.renamer", opts "rename")
  map("n", "<leader>la", vim.lsp.buf.code_action, opts "code actions")
  map("n", "<leader>ls", function()
    vim.lsp.buf.signature_help { focus = false, silent = true, max_height = 7, border = "single" }
  end, opts "signature help")
end

nvchadlsp.defaults()

local servers = { "html", "cssls", "rust_analyzer", "ts_ls", "clangd" }
vim.lsp.enable(servers)

vim.lsp.config["rust_analyzer"] = {
  cargo = {
    allFeatures = true,
  },
}

vim.lsp.config["clangd"] = {
  cmd = {
    "clangd",
    "--clang-tidy",
    "--background-index",
    "--offset-encoding=utf-8",
  },
  root_markers = { ".clangd", "compile_commands.json" },
  filetypes = { "c", "cpp" },
}

-- read :h vim.lsp.config for changing options of lsp servers
