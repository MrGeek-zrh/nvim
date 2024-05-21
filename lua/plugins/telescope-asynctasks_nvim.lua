return {
  "GustavoKatel/telescope-asynctasks.nvim",
  keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>as",
        function() require('telescope').extensions.asynctasks.all() end,
        desc = "find all asyntasks",
      },
  },
}
