return function(mode, lhs, rhs, opts, options)
  options = options or {}

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end
