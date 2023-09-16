return {
    "iamcco/markdown-preview.nvim",
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    config = function()
        -- set keymap for opening markdown files
        vim.keymap.set("n", "<leader>p", ":MarkdownPreview<CR>")
    end
}