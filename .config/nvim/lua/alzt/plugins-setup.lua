local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install your plugins here
return packer.startup(function(use)

  -- Packer
  use("wbthomason/packer.nvim")

  -- Colorschemes
  use({"catppuccin/nvim", as = "catppuccin"})

  -- icons
  use("kyazdani42/nvim-web-devicons")

  -- Lualine / Statusline
  use("nvim-lualine/lualine.nvim")

  -- Telescope Fuzzy Finder
	use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-lua/plenary.nvim" })

  -- Alpha Neovim Greeter
  use({ "goolord/alpha-nvim" })

  -- Auto Closing
  use({ "windwp/nvim-autopairs" })

  -- cmp
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions

  -- Treesitter Syntax Hightlighting
  use({
		"nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
	})

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
