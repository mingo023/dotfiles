local present, cmp = pcall(require, "cmp")

if not present then
  return
end

vim.opt.completeopt = "menuone,noselect"

cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered({
      border = "rounded",
    }),
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", require("plugins.lspkind_icons").icons[vim_item.kind], vim_item.kind)

      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        buffer = "[BUF]",
        luasnip = "[Snip]",
        ["vim-dadbod-completion"] = "[DB]",
      })[entry.source.name]

      return vim_item
    end,
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-d>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      i = cmp.mapping.confirm({
        select = true,
      }),
    }),
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end,
  },
  sources = {
    {
      name = "nvim_lsp",
    },
    {
      name = "luasnip",
    },
    {
      name = "buffer",
    },
    {
      name = "nvim_lua",
    },
    {
      name = "path",
    },
  },
})

local autocomplete_group = vim.api.nvim_create_augroup("vimrc_autocompletion", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "mysql", "plsql" },
  callback = function()
    cmp.setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
  end,
  group = autocomplete_group,
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})
