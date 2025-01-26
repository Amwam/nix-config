vim.opt.clipboard = 'unnamed'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.copyindent = true

vim.opt.expandtab = true -- Insert spaces instead of tabs

-- Search improvements
vim.opt.incsearch = true -- Highlight as you search
vim.opt.ignorecase = true -- Ignore case when seaching
vim.opt.smartcase = true -- Ignores case, except when capitals are used

vim.opt.cursorline = true -- Highlight current line

vim.opt.mouse = 'a'

vim.g.mapleader = ' '

require("lazy").setup({
    -- disable all update / install features
    -- this is handled by nix
    rocks = {
        enabled = false
    },
    pkg = {
        enabled = false
    },
    install = {
        missing = false
    },
    change_detection = {
        enabled = false
    },
    spec = {{
        import = "plugins"
    }}
})
