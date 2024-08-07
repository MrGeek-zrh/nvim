return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>sg",
        function() require("telescope").extensions.live_grep_args.live_grep_args() end,
        desc = "find file with argv",
      },
  },
  config = function()
    local telescope = require("telescope")

    -- first setup telescope
    telescope.setup({
      -- your config
      defaults = {
        layout_strategy = "vertical",
        layout_config = { height = 0.95 },
      },
    })

    -- then load the extension
    telescope.load_extension("live_grep_args")
  end,
}
