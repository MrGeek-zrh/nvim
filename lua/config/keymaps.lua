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

-- 定义一个全局变量来存储窗口状态
local zoom_state = {
  cur_winview = nil,
  cur_bufname = nil,
  zoomed = false,
}
-- 定义 Zoom 函数
function Zoom()
  if zoom_state.zoomed then
    -- 如果已经是最大化状态，关闭 tab 并恢复之前的窗口状态
    vim.cmd("tabclose")
    if zoom_state.cur_bufname == vim.fn.bufname("") then
      vim.fn.winrestview(zoom_state.cur_winview)
    end
    zoom_state.zoomed = false
  else
    -- 保存当前窗口的视图和缓冲区名称
    zoom_state.cur_winview = vim.fn.winsaveview()
    zoom_state.cur_bufname = vim.fn.bufname("")
    vim.cmd("tab split")
    zoom_state.zoomed = true
  end
end

-- 将 Zoom 函数绑定到 <leader>z
vim.api.nvim_set_keymap("n", "<leader>z", ":lua Zoom()<CR>", { noremap = true, silent = true })
