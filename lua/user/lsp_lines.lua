local cmp_status_ok, lsp_lines = pcall(require, "lsp_lines")
if not cmp_status_ok then
  return
end

lsp_lines.setup()

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { only_current_line = true }
})

-- vim.keymap.set(
--   "",
--   "<Leader>l",
--   {desc = "Toggle lsp_lines"}
-- )
