if true then
  return {}
end

return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      ds_pinyin_lsp = {
        mason = false, -- set to false if you don't want this server to be installed with mason
        cmd = { "ds-pinyin-lsp" },
        filetypes = {
          "markdown",
          "org",
          "c",
          "cpp",
          "rust",
          "go",
          "java",
          "python",
          "javascript",
          "typescript",
          "html",
          "css",
          "kotlin",
          "dart",
          "lua",
        },
        single_file_support = true,
        root_dir = function(fname)
          local util = require("lspconfig/util")
          local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)

          local root_pattern = util.root_pattern(".root", ".git")
          return root_pattern(filename) or util.path.dirname(filename)
        end,
        init_options = {
          enabled = true,
          db_path = "/Users/mrgeek/document/dict_db3/dict.db3",
          completion_on = true,
          completion_around_mode = true,
          show_symbols = true,
          show_symbols_only_follow_by_hanzi = true,
          show_symbols_by_n_times = 2,
          max_suggest = 50,
          match_as_same_as_input = false,
          match_long_input = true,
          completion_trigger_characters = "  ",
        },
        settings = {},
      },
    },
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {},
  },
}
