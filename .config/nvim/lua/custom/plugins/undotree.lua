---Visualizes the undo history
---@type LazyPluginSpec
return {
  'mbbill/undotree',
  config = function()
    -- local custom = require 'custom.utils'
    local width = 30

    vim.g.undotree_SplitWidth = width
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_DiffAutoOpen = 0
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_HelpLine = 0
  end,
  keys = {
    { '<leader>u', '<Cmd>UndotreeToggle<CR>', desc = 'Undo Tree' },
  },
}
