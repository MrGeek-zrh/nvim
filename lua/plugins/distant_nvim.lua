if true then
  return {}
end
return {
  "chipsenkbeil/distant.nvim",
  config = function()
    require("distant"):setup()
  end,
}
