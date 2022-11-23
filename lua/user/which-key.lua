local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  vim.cmd("echom 'Could not load which-key'")
	return
end

wk.setup()
