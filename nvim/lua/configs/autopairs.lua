local present1, autopairs = pcall(require, "nvim-autopairs")

if not present1 then
  return
end

autopairs.setup()
