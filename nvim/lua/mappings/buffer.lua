local map = require('utils.mapping')

-- map("n", ",bd", ":bp|bd #<CR>", {
--     noremap = true,
--     silent = true
-- })
map("n", ",bb", ":bufdo bwipeout <CR>", {
    noremap = true,
    silent = true
})
map("n", ",bn", ":bn <CR>", {
    noremap = true,
    silent = true
})
map("n", ",bp", ":bp <CR>", {
    noremap = true,
    silent = true
})
map("n", "<Leader>bp", ":BufferLinePick <CR>", {
    noremap = true,
    silent = true
})
map("n", "<Leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", {
    noremap = true,
    silent = true
})
map("n", "<Leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", {
    noremap = true,
    silent = true
})
map("n", "<Leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", {
    noremap = true,
    silent = true
})
map("n", "<Leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", {
    noremap = true,
    silent = true
})
map("n", "<Leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", {
    noremap = true,
    silent = true
})
map("n", "<Leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", {
    noremap = true,
    silent = true
})
