function gh_link_shorten()
  local link = vim.fn.getreg("+")
  vim.fn.setreg("+", "use " .. link:gsub("https://github.com/", ""))
end
