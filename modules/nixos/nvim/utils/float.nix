{...}: {
  programs.nvf.settings.vim.luaConfigRC.float = ''
    local function open_float(suffix, cmd, opacity)
      local dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':t'):gsub('^%.', "")
      local session = 'float-' .. dir .. '-' .. suffix
      vim.fn.system('tmux has-session -t =' .. session .. ' 2>/dev/null')
      if vim.v.shell_error ~= 0 then
        if cmd and cmd ~= "" then
          vim.fn.system({'tmux', 'new-session', '-d', '-s', session, 'sh', '-c', cmd .. '; exec ${SHELL:-sh}'})
        else
          vim.fn.system({'tmux', 'new-session', '-d', '-s', session})
        end
      end
      vim.fn.jobstart(
        {
          'setsid', '-f', 'kitty',
          '--class', 'tmux-float',
          '--title', 'tmux-float-' .. session,
          '-o', 'background_opacity=' .. (opacity or 1.0),
          'tmux', 'attach-session', '-t', '=' .. session,
        },
        { detach = true }
      )
    end

    vim.keymap.set('n', '<leader>llg', function() open_float('lazygit', 'lazygit', 1.0) end,
      { desc = 'Float: lazygit', silent = true })
    vim.keymap.set('n', '<leader>lld', function() open_float('lazydocker', 'lazydocker', 1.0) end,
      { desc = 'Float: lazydocker', silent = true })
    vim.keymap.set('n', '<leader>no', function()
      open_float('coldnote', 'bun run /home/ozzurep/coldLab/tui/cold-note-opentui/src/index.tsx', 1.0)
    end, { desc = 'Float: cold-note', silent = true })
    vim.keymap.set('n', '<leader>ccc', function() open_float('claude', 'claude', 1.0) end,
      { desc = 'Float: claude', silent = true })
    vim.keymap.set('n', '<leader>ccd', function()
      open_float('claude-dangerous', 'claude --dangerously-skip-permissions', 1.0)
    end, { desc = 'Float: claude (skip-permissions)', silent = true })
  '';
}
