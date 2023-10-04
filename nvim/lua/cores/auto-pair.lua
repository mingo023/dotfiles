local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
local npairs = require("nvim-autopairs")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- Rule("$$", "$$"):with_pair(ts_conds.is_not_ts_node({"import_statement", "import_specifier"}))
-- Rule("$", "$"):with_pair(ts_conds.is_not_ts_node({"import_statement", "import_specifier"}))

npairs.setup({
  check_ts = true,
  ts_config = {
    javascript = { "import_statement" },
  },
})

require("nvim-autopairs").setup({})
