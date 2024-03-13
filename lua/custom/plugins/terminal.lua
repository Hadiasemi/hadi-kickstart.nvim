return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      size = 20,
      hide_numbers = true,
      shade_terminals = true,
      direction = 'float',
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal'
        }
      }
    }

    -- Define a global function for setting terminal keymaps
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    -- Set up an autocmd to apply these keymaps for terminal buffers
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end
}

