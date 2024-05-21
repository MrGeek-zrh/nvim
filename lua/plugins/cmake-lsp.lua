return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      cmake = {
        mason = false, -- set to false if you don't want this server to be installed with mason
        cmd = { "cmake-language-server" },
        filetypes = { "cmake" },
        root_dir = function(fname)
          local util = require("lspconfig/util")
          local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
          local root_pattern = util.root_pattern("CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake")
          return root_pattern(filename) or util.path.dirname(filename)
        end,
        init_options = {
          buildDirectory = "build",
        },
        single_file_support = true,
      },
    },
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      -- example to setup with typescript.nvim
      -- tsserver = function(_, opts)
      --   require("typescript").setup({ server = opts })
      --   return true
      -- end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
  },
}
