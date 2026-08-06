return {
  -- mini.animate 의 창 크기 애니메이션을 끕니다.
  --
  -- 이유: edgy.nvim 이 neo-tree 를 고정(pinned) 창으로 관리하면서 레이아웃 폭을 강제합니다.
  -- <C-w>> 같은 수동 리사이즈를 하면
  --   1) mini.animate 가 폭 변화를 여러 프레임으로 쪼개 애니메이션하고
  --   2) edgy 가 중간 프레임마다 자기 레이아웃으로 되돌리고
  --   3) 그 되돌림이 또 크기 변화라 다시 애니메이션되는
  -- 되먹임 고리가 생겨 화면이 계속 깜박입니다.
  --
  -- edgy 는 자기가 일으킨 애니메이션 동안에만 vim.g.minianimate_disable 을 켜서
  -- 조율하므로(edgy/config.lua 의 animate.on_begin/on_end), 수동 리사이즈 경로는
  -- 보호되지 않습니다. resize 애니메이션만 꺼서 고리를 끊습니다.
  --
  -- 스크롤 / 커서 / 창 열고닫기 애니메이션은 그대로 유지됩니다.
  {
    "nvim-mini/mini.animate",
    optional = true,
    opts = {
      resize = { enable = false },
    },
  },
}
