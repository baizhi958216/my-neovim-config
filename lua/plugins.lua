local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local nvim_tree_plugin = {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup {}
    end
}
local lualine_plugin = {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup()
    end
}

local monokai_theme = {
    "tanvirtin/monokai.nvim",
    version = "*",
    name = "monokai"
}

local catppuccin_theme = {
    "catppuccin/nvim",
    version = "*",
    name = "catppuccin"
}

local lspconfig = {
    "neovim/nvim-lspconfig",
    version = "*",
    name = "lspconfig"
}

local transparent = {
    "xiyaowong/transparent.nvim",
    version = "*",
    name = "transparent"
}

local neogit = {
    "NeogitOrg/neogit",
    version = "*",
    name = "neogit",
    dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
    "echasnovski/mini.pick",         -- optional
    },
    config = true
}

require("lazy").setup(
    {lualine_plugin,monokai_theme,nvim_tree_plugin,catppuccin_theme,lspconfig,transparent,neogit}
)
