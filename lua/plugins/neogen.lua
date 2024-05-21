-- 生成代码注释的插件
return {
  "danymat/neogen",
  enabled = true,
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("neogen").setup({})
    local opts = { noremap = true, silent = true }
    -- 为函数生成注释
    vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
  end,
}
