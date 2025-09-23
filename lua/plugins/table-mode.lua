return {
  "dhruvasagar/vim-table-mode",
  ft = { "markdown", "org", "text" }, -- 필요한 파일 타입에서만 로드
  cmd = { "TableModeToggle", "TableModeEnable" }, -- 명령어로도 로드 가능
  config = function()
    -- 기본 설정
    vim.g.table_mode_corner = "|" -- 표 모서리 문자
    vim.g.table_mode_delimiter = " " -- 구분자

    -- 마크다운 호환 설정 (선택사항)
    vim.g.table_mode_corner_corner = "+"
    vim.g.table_mode_header_fillchar = "="
  end,
  keys = {
    { "<leader>tm", "<cmd>TableModeToggle<cr>", desc = "Toggle Table Mode" },
    { "<leader>tr", "<cmd>TableModeRealign<cr>", desc = "Realign Table" },
    { "<leader>ts", "<cmd>TableSort<cr>", desc = "Sort Table" },
    { "<leader>tf", "<cmd>TableAddFormula<cr>", desc = "Add Formula" },
    { "<leader>tc", "<cmd>TableEvalFormulaLine<cr>", desc = "Eval Formula" },
  },
}
