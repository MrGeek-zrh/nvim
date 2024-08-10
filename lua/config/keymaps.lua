-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("t", "<c-h>", "<c-h>", nil)
vim.keymap.set("t", "<c-j>", "<c-j>", nil)
vim.keymap.set("t", "<c-k>", "<c-k>", nil)
vim.keymap.set("t", "<c-l>", "<c-l>", nil)

-- 关闭quickfix窗口
vim.keymap.set("n", "<leader>qw", "<cmd>cclose<cr>", nil)

-- 在插入模式下移动到行首
vim.keymap.set("i", "<c-a>", "<c-o>0", nil)
-- 在插入模式下移动到行尾
vim.keymap.set("i", "<c-e>", "<c-o>$", nil)

-- 定义 Zoom 函数
function Zoom()
  -- 检查是否在最大化状态 (tab 页数 > 1 且窗口数 == 1)
  if vim.fn.tabpagenr("$") > 1 and vim.fn.tabpagewinnr(vim.fn.tabpagenr(), "$") == 1 then
    -- 保存当前窗口的视图和缓冲区名称
    local cur_winview = vim.fn.winsaveview()
    local cur_bufname = vim.fn.bufname("")

    -- 关闭 tab
    vim.cmd("tabclose")

    -- 恢复视图
    if cur_bufname == vim.fn.bufname("") then
      vim.fn.winrestview(cur_winview)
    end
  else
    -- 创建一个新的 tab 并在其中拆分窗口
    vim.cmd("tab split")
  end
end
-- 将 Zoom 函数绑定到 <leader>z
vim.api.nvim_set_keymap("n", "<leader>z", ":lua Zoom()<CR>", { noremap = true, silent = true })
