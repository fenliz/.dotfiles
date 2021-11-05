local g = vim.g
local fn = vim.fn

g.mapleader = ' '

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('plugins')

require('explorer')
require('files')
require('finder')
require('lsp')
require('navigation')
require('problems')
require('theme')
require('text')
