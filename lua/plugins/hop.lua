return {
  "phaazon/hop.nvim",
  branch = "v2",
  event = "BufRead",
  config = function()
    require("hop").setup({
      keys = "etovxqpdygfblzhckisuran",
      case_insensitive = false,
      multi_windows = true,
    })
  end,
}
