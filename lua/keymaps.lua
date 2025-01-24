-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local keymap = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- keymap('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- keymap('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- keymap('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- keymap('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Write/Quit buffer
keymap('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite current buffer' })
keymap('n', '<leader>q', '<cmd>q<CR>', { desc = '[Q]uit current buffer' })
keymap('n', '<leader>Q', '<cmd>qa<CR>', { desc = '[Q]uit [A]ll buffers' })

-- Resize window
keymap('n', '<C-Up>', '<C-w>+')
keymap('n', '<C-Down>', '<C-w>-')
keymap('n', '<C-Left>', '<C-w><')
keymap('n', '<C-Right>', '<C-w>>')

-- Moving code in visual mode
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Switching Tabs
keymap('n', '<TAB>', 'gt')
keymap('n', '<S-TAB>', 'gT')

-- Visuals for moving around in window
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<C-u>', '<C-u>zz')
keymap('n', '<C-f>', '<C-f>zz')
keymap('n', '<C-b>', '<C-b>zz')
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')

-- Moving windows around (these don't work)
-- keymap('n', '<C-H>', '<C-w>H', { desc = 'Move the current window to be at the far left (full height)' })
-- keymap('n', '<C-L>', '<C-w>L', { desc = 'Move the current window to be at the far right (full height)' })
-- keymap('n', '<C-J>', '<C-w>J', { desc = 'Move the current window to be at the very bottom (full width)' })
-- keymap('n', '<C-K>', '<C-w>K', { desc = 'Move the current window to be at the very top (full width)' })
-- The following keymap is not useful for the time being, because
-- <C-T> is mapped to a new tab in Terminal. Keeping it for future use.
-- keymap('n', '<C-T>', '<C-w>T', { desc = 'Move the current window to a new tab page' })

-- Splitting windows
keymap('n', '<C-s>', '<cmd>split<CR>', { noremap = true })

-- The following keymap joins the current line with the next one and
-- does not move the cursor from its original position. The default
-- behavior is to join the two lines and move the cursor to the merging point.
-- The temporary mark that is being created is deleted in the end.
keymap('n', 'J', 'mzJ`z<cmd>delm z<CR>')

-- vim: ts=2 sts=2 sw=2 et
