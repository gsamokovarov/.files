return {
  {
    "folke/lazy.nvim", -- Dummy plugin to hold mine custom functions
    name = "custom-functions",
    config = function()
      local M = {}

      -- WriteAndOrQuit function
      function M.write_and_or_quit()
        local ok, _ = pcall(vim.cmd, "ZZ")
        if not ok then
          vim.cmd("q!")
        end
      end

      -- Choose '^' or '0' depending on the cursor position
      function M.clever_jump_first()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local before = string.sub(line, 1, col + 1)

        if string.match(before, "^%s+%S$") then
          return "0"
        else
          return "^"
        end
      end

      -- Create new test files in vim-rails powered projects
      function M.rnew(name)
        local parts = vim.split(name, "/")
        local base_name = parts[#parts]
        local dir_parts = {}

        for i = 1, #parts - 1 do
          table.insert(dir_parts, parts[i])
        end

        local underscored_name = base_name
        if string.match(underscored_name, "%.rb$") then
          underscored_name = vim.fn.fnamemodify(underscored_name, ":r")
        end

        M.create_ruby_test(underscored_name, dir_parts)
        vim.cmd("redraw!")
      end

      function M.create_ruby_test(name, dir_parts)
        local test_parts = vim.deepcopy(dir_parts)
        table.insert(test_parts, name .. "_spec.rb")
        local test_name = table.concat(test_parts, "/")

        if string.match(test_name, "app/") then
          test_name = M.substitute_path_segment(test_name, "app", "spec")
        else
          test_name = M.substitute_path_segment(test_name, "lib", "spec/lib")
        end

        M.ensure_directory_exists(test_name)

        vim.cmd("split " .. test_name)
        vim.api.nvim_buf_set_lines(0, 0, 0, false, {
          "require 'rails_helper'",
          "",
          ""
        })
        vim.api.nvim_buf_set_lines(0, -1, -1, false, {})
        vim.cmd("normal! G")
        vim.cmd("write")
      end

      function M.substitute_path_segment(expr, segment, replacement)
        local pattern = "(^/)" .. segment .. "(/.*)"
        return string.gsub(expr, pattern, "%1" .. replacement .. "%2")
      end

      function M.ensure_directory_exists(file)
        local dir = vim.fn.fnamemodify(file, ":p:h")
        if vim.fn.isdirectory(dir) == 0 then
          vim.fn.mkdir(dir, "p")
        end
      end

      -- Set the initial background theme
      function M.reset_background()
        local file = vim.fn.expand("$HOME/.colorscheme")

        if vim.fn.filereadable(file) == 1 and vim.fn.readfile(file)[1] == "light" then
          vim.schedule(function()
            vim.opt.background = "light"
          end)
        else
          vim.schedule(function()
            vim.opt.background = "dark"
          end)
        end
      end

      -- Create user commands
      vim.api.nvim_create_user_command('Rnew', function()
        M.rnew(vim.fn.expand('%'))
      end, {})

      -- Custom function keymaps
      vim.keymap.set('n', 'Q', function() M.write_and_or_quit() end, { noremap = true, silent = true })
      vim.keymap.set('n', 'Я', function() M.write_and_or_quit() end, { noremap = true, silent = true })
      vim.keymap.set('n', '0', function() return M.clever_jump_first() end, { expr = true, noremap = true })
      vim.keymap.set('v', '0', function() return M.clever_jump_first() end, { expr = true, noremap = true })

      -- Signal handling for background reset
      local signals_group = vim.api.nvim_create_augroup('Signals', { clear = true })
      vim.api.nvim_create_autocmd('Signal', {
        group = signals_group,
        pattern = 'SIGUSR1',
        callback = function()
          M.reset_background()
          vim.cmd("redraw")
        end,
      })

      M.reset_background()

      -- Export module globally
      _G.config_functions = M
    end,
  },
}
