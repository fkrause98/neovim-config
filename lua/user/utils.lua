function gh_link_shorten()
 link = vim.fn.getreg("+")
 vim.fn.setreg("+", link:gsub("https://github.com/", ""))
end
