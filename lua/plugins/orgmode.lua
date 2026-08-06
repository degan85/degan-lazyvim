return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    require("orgmode").setup({
      org_agenda_files = "~/dev/doc/orgfiles/**/*",
      org_default_notes_file = "~/dev/doc/orgfiles/inbox.org",
      org_todo_keywords = { "TODO(t)", "IN_PROGRESS(i)", "|", "DONE(d)", "CANCELED(c)" },
      org_archive_location = "~/dev/doc/orgfiles/archive/%s_archive::", -- 연도별 아카이브
      org_hide_leading_stars = true,
      org_hide_emphasis_markers = true,
      org_capture_templates = {
        t = {
          description = "Task",
          template = "* TODO %?\n  SCHEDULED: %t\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:",
          target = "~/dev/doc/orgfiles/inbox.org",
          headline = "Tasks",
        },
        n = {
          description = "Note",
          template = "* %?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n  %a",
          target = "~/dev/doc/orgfiles/references/notes.org",
          headline = "Quick Notes",
        },
        m = {
          description = "Meeting Notes",
          template = [[
* 📅 %^{미팅 제목} :meeting:%^{추가 태그}:
  SCHEDULED: %^T
  :PROPERTIES:
  :ATTENDEES: %^{참석자}
  :LOCATION: %^{장소|온라인|회의실A|회의실B}
  :END:
  
** 📋 Agenda
   %^{안건}
   
** 📝 Discussion
   %?
   
** ✅ Action Items
   - [ ] 
   
** 🔗 References
   ]],
          target = "~/dev/doc/orgfiles/references/meetings.org",
        },
        j = {
          description = "Daily Journal",
          template = [[
* %<%Y-%m-%d %A> - Daily Journal
** 🌅 Morning Thoughts
   %?
** 📋 Today's Goals
   - [ ] 
** 📚 What I Learned
   
** 🎯 Tomorrow's Priority
   
]],
          target = "~/dev/doc/orgfiles/journal/" .. os.date("%Y-%m") .. ".org",
        },
        i = {
          description = "Idea",
          template = [[
* 💡 IDEA %^{제목} :idea:
  [%<%Y-%m-%d %a %H:%M>]
  
** 개념
   %?
   
** 잠재적 가치
   
** 다음 단계
   - [ ] 조사하기
   - [ ] 프로토타입
   
** 관련 링크
   %x]], -- 클립보드 내용 자동 삽입
          target = "~/dev/doc/orgfiles/ideas.org",
        },
      },
    })
  end,
  -- treesitter 의존성 블록 제거:
  -- 1) `org` 파서는 nvim-orgmode 가 자체 번들/설치하므로 ensure_installed 불필요.
  --    nvim-treesitter main 브랜치 레지스트리엔 `org` 가 없어 경고만 발생했음.
  -- 2) `opts.highlight` 는 treesitter master 브랜치 전용 옵션으로 main 에선 무시됨.
}
