vim.g.mapleader = " "

local keymap = vim.keymap -- for coonciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk"})

keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Clear search highlights"})

-- increment/decrement number
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number"}) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number"}) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window verically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally"})
keymap.set("n", "<leader>se", "<C-w>=", { desc = "make splits equal size"})
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close current split"})

-- tabs management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close curr tab"}) -- close curr tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab"}) -- go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab"}) -- open current buffer
