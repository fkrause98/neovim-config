local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
  vim.cmd("echom Could not load wilder")
  return
end
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline(),
    wilder.search_pipeline()
  ),
})

wilder.set_option('renderer', wilder.wildmenu_renderer({
  highlighter = wilder.basic_highlighter(),
}))
