-- LSP 설정 안정화
-- diagnostic buffer 오류 해결
return {
  -- nvim-lspconfig 설정 오버라이드
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- 기존 opts를 유지하면서 diagnostic 설정만 추가/수정
      opts.diagnostics = vim.tbl_deep_extend("force", opts.diagnostics or {}, {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✗",
            [vim.diagnostic.severity.WARN] = "⚠",
            [vim.diagnostic.severity.HINT] = "💡",
            [vim.diagnostic.severity.INFO] = "ℹ",
          },
        },
      })
      
      -- diagnostic 설정 적용
      vim.diagnostic.config(opts.diagnostics)
      
      return opts
    end,
  },
}
