return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  keys = {
    {
      "<F9>",
      function()
        require("dapui").float_element("scopes", { enter = true })
      end,
      desc = "float element",
    },
  },
  config = function()
    require("dapui").setup({
      mappings = {
        edit = "e",
        expand = { "w", "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t",
      },
    })
  end,
}
