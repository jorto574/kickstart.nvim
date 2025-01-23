-- vscode_modern_theme

return { -- This theme is one I found on the internet and resembles best the one I had in VSCode.
  'gmr458/vscode_modern_theme.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('vscode_modern').setup {
      cursorline = true,
      transparent_background = false,
      nvim_tree_darker = true,
    }
    vim.cmd.colorscheme 'vscode_modern'
  end,
}
