local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)
keymap("n", "<leader>ww", "<C-w><C-w>", opts)
-- Emacs-like window splitting
keymap("n", "<C-x>3", ":vsplit<CR>", opts)
keymap("n", "<C-x>2", ":split<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bl", ":bprevious<CR>", opts)
-- Git
keymap("n", "<leader>gg", ":Neogit<CR>", opts)
-- keymap("n", "<leader>gb", ":Gitsigns toggle_current_line_blame <CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Emacs like in insert mode
keymap("i", "<C-A>","<HOME>", opts)
keymap("i", "<C-E>","<END>", opts)
keymap("i", "<C-K>","<ESC>lC", opts)
keymap("i", "<C-D>","<ESC>ls", opts)
keymap("i", "<C-N>","<Down>", opts)
keymap("i", "<C-P>","<Up>", opts)
keymap("i", "<C-B>","<Left>", opts)
keymap("i", "<C-F>", "<Right>", opts)
keymap("i", "<A-f>", "<C-S-Right>", opts)
-- keymap("i", "<A-b>", "<ESC>b", opts)

-- Telescope
--keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- local find_files_command = telescope_config.project_files
-- local list_buffers_command = telescope_config.list_buffers_command()
-- "<cmd>lua require('telescope.builtin').buffers()<cr>"
-- keymap("n", "<leader>bb", list_buffers_command, opts)
keymap("n", "<leader>bb", "<cmd>lua require'telescope.builtin'.buffers(require'telescope.themes'.get_ivy({layout_config = {height = 15}}))<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require'user.telescope-config'.find_files()<cr>", opts)
keymap("n", "<leader>pf", "<cmd>lua require'user.telescope-config'.project_find_files()<cr>", opts)
keymap("n", "<leader>fr", "<cmd>lua require'user.telescope-config'.recent_files()<cr>", opts)
-- keymap("n", "<leader>fr", "<cmd>Telescope frecency previewer=false<CR>", opts)
keymap("n", "<leader>sp", "<Cmd>Telescope live_grep <CR>", opts)
keymap("n", "<leader>ss", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require'telescope.themes'.get_ivy({layout_config={height=15}}))<cr>", opts)
keymap("n", "<leader>si", "<cmd>Telescope lsp_document_symbols symbols=module,function,object<cr>", opts)
-- keymap("n", "<leader>sp", "<cmd>lua require('telescope.builtin').grep_string()<CR>")



-- Nvim-tree
keymap("n", "<leader>op", "<cmd>lua require('nvim-tree.api').tree.toggle(false, true)<cr>", opts)
-- Restore file
keymap("n", "<leader>br", "<cmd>e!<cr>", opts)
vim.keymap.set("n", "<leader>cX", "<cmd>TroubleToggle<cr>",
  opts
)
-- vim.keymap.set("n", "<leader>cX", "<cmd>TroubleToggle workspace_diagnostics<cr>",
--   opts
-- )
vim.keymap.set("n", "<leader>cx", "<cmd>TroubleToggle document_diagnostics<cr>",
  opts
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  opts
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  opts
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  opts
)
