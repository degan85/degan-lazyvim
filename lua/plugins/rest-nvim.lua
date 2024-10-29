return {
  {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- 옵션들을 여기에 추가할 수 있습니다
      })
    end,
  },
}
