if true then
  return {}
end
return {
  "EtiamNullam/deferred-clipboard.nvim",
  config = function()
    require("deferred-clipboard").setup({
      lazy = true,
    })
  end,
}
