--[[ Custom keyboard shortcuts for Neovim

Modes:
    'n' - normal_mode
    'i' - insert_mode
    'v' - visual_mode (visual and select)
    'x' - visual_block_mode (visual only)
    's' - select_mode (select only)
    't' - terminal_mode (term_mode)
    'c' - command_mode
    'o' - operator_pending_mode -- e.g. y in yiw
]]

-- Set <space> as the leader key
vim.g.mapleader = " "

-- Manage config
vim.keymap.set("n", "<leader>zz", "<cmd>source $MYVIMRC<CR>", { desc = 'Reload config' })
vim.keymap.set('n', '<leader>lr', '<cmd>source %<CR>', { desc = '[L]oad file a.k.a source active buffer' })

-- Switch modes
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Explore file tree ([P]roject [V]view)' })
vim.keymap.set("i", "jk", "<Esc>", { desc = 'Exist insert mode' })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = 'Exit terminal mode' })
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = 'Enter normal mode' })

-- Navigation
vim.keymap.set({ "n", "v", "i" }, "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>",
    { desc = "Switch tmux sessions" })
-- Switch buffers
local default_opts = { noremap = true, silent = true }
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set({ "n", "v", "i" }, "[b", "<cmd>bp<CR>", { desc = "Previous buffer :bprevious" })
vim.keymap.set({ "n", "v", "i" }, "]b", "<cmd>bn<CR>", { desc = "Next buffer :bnext" })
-- vim.keymap.set({ "n" }, "š", "<cmd>b#<CR>", { desc = "Toggle between two buffers. <C-^> in other layout" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to other buffer" })
-- Switch tabs
vim.keymap.set({ "n" }, "]t", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set({ "n" }, "[t", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- Quickfix navigation
vim.keymap.set("n", "<C-A-j>", "<cmd>cnext<CR>zz", { desc = "Quickfix next" })
vim.keymap.set("n", "<C-A-k>", "<cmd>cprev<CR>zz", { desc = "Quickfix previous" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Like :cnext but use location list and not the quickfix" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Like :cprev but use location list and not the quickfix" })
-- Moving cursor in normal mode
vim.keymap.set('n', 'gh', '_', { desc = 'Go to start of line. Faster that "_"' })
vim.keymap.set('n', 'gl', '$', { desc = 'Go to end of line. Faster that "$"' })
vim.keymap.set('n', 'gj', 'f)', { desc = 'Go to closing bracket.' })
vim.keymap.set('n', 'gk', 'f}', { desc = 'Go to closing curly bracket' })
-- Moving cursor in insert mode
vim.keymap.set('i', '<C-l>', '<Esc>la', { desc = 'Move backward by one char in insert mode' })
vim.keymap.set('i', '<C-k>', '<Esc>la', { desc = 'Move backward by one char in insert mode' })
vim.keymap.set('i', '<C-h>', '<Esc>ha', { desc = 'Move forward by one char in insert mode' })
vim.keymap.set('i', '<C-j>', '<Esc>ha', { desc = 'Move forward by one char in insert mode' })
-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move line up' })
-- Move selected line / block of text in visual mode
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = 'Move line down' })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = 'Move line up' })

-- Lists
vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- Resizing panes with arrow keys
vim.keymap.set("n", "<Left>", ":vertical resize +1<CR>", default_opts)
vim.keymap.set("n", "<Right>", ":vertical resize -1<CR>", default_opts)
-- vim.keymap.set("n", "<Up>", ":resize -1<CR>", default_opts)
-- vim.keymap.set("n", "<Down>", ":resize +1<CR>", default_opts)

-- Stay in the middle when navigating or searching
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center screen when moving down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center screen when moving up" })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Center search results' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Center search results' })

-- Copy, paste, delete
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = 'Delete to void register' })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'Paste without messing your register' })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste over currently selected text without yanking it" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = 'asbjornHaland -- copy to system clipboard #1' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'asbjornHaland -- copy to system clipboard #2' })
vim.keymap.set({ "n", "v" }, "<leader>v", [["+p]], { desc = 'Paste from system clipboard' })

-- Similar to other editors (save, quit, select all)
vim.keymap.set({ "n", "v", "i" }, "<A-s>", vim.cmd.update, { desc = ":write, but only when the buffer is modified." })
vim.keymap.set({ "n", "v" }, "<leader>qa", "<cmd>qa<cr>", { desc = "Quit all" })
vim.keymap.set({ "n", "v", "i" }, "<A-q>", "<cmd>q<CR>", { desc = '[Q]uit neovim' })
vim.keymap.set({ "n", "v", "i" }, "<C-A-q>", "<cmd>q!<CR>", { desc = 'Force [q]uit neovim' })
vim.keymap.set({ "n", "v" }, "<A-a>", "<esc>ggVG", { desc = 'Select all text' })

-- Quotes
vim.keymap.set('n', '<leader>q"', 'ciw""<Esc>P', { desc = 'Add double [q]uotes around the word' })
vim.keymap.set('n', '<leader>q\'', 'ciw\'\'<Esc>P', { desc = 'Add single [q]uotes around the word' })
vim.keymap.set('n', '<leader>qw', 'ciw`<C-r>"`<Esc>', { desc = 'Add single [q]uotes around the word' })

-- Better indenting (stay in indent mode)
vim.keymap.set("v", "<", "<gv", default_opts)
vim.keymap.set("v", ">", ">gv", default_opts)

-- Increment / decrement numbers
vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement number' })

-- Other text manipulations
vim.keymap.set("n", "<leader>n", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Rename symbol (replace word under the cursor)" })
vim.keymap.set("n", "J", "mzJ`z", { desc = 'Join lines. Append line below, but keep cursor in place' })
vim.keymap.set("n", "qq", "i<CR><Esc>", { desc = 'split line' })

-- Etc
vim.keymap.set("n", "<leader>nn", "<cmd> set nu! rnu! <CR>",
    { desc = "perf: toggle line numbers and relative line numbers" })
vim.keymap.set("n", "Q", "<nop>", { desc = 'Disable capital Q' })
vim.keymap.set({ "n", "v" }, "<A-z>", "<cmd>set wrap!<CR>", { desc = 'Toggle line wrap' })
vim.keymap.set("n", "<leader>xc", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear search highlight" })

-- Sandbox
vim.keymap.set('n', 'ds', 'vb_d', { desc = 'Delete backwards to the start of the line' })
-- Sort lines
vim.keymap.set({ "v" }, "<C-g>", "<cmd>'<,'>sort<CR>", { desc = 'Sort selected lines' })
-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- Move Lines (test)
vim.keymap.set("n", "<S-<>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

local function vim_opt_toggle(opt, on, off)
    return function()
        local message
        if vim.opt[opt]:get() == off then
            vim.opt[opt] = on
            message = opt .. " enabled"
        else
            vim.opt[opt] = off
            message = opt .. " disabled"
        end
        vim.notify(message)
    end
end
vim.keymap.set('n', '<F3>', vim_opt_toggle("spell", true, false), { desc = "Toggle spelling" })
vim.keymap.set('n', 'U', '<C-r>', { desc = "Redo", noremap = true })
