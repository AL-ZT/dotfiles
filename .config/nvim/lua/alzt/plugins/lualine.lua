local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    globalstatus = false,
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
    theme = "catppuccin",
  }
})
