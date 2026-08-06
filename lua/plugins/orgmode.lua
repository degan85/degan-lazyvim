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
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, { "org" })
        else
          opts.ensure_installed = { "org" }
        end

        opts.highlight = opts.highlight or { enable = true }
        if opts.highlight then
          opts.highlight.additional_vim_regex_highlighting = { "org" }
        end

        return opts
      end,
    },
  },
}
