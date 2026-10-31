local treesitter = require("nvim-treesitter")

treesitter.setup({})

treesitter.install({
    "bash",
    "c",
    "cmake",
    "cpp",
    "fish",
    "lua",
    "luadoc",
    "make",
    "markdown",
    "markdown_inline",
    "printf",
    "python",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
})

local group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = {
        "sh",
        "c",
        "cmake",
        "cpp",
        "fish",
        "lua",
        "make",
        "markdown",
        "python",
        "toml",
        "vim",
        "help",
        "yaml",
    },
    callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)

        if ok then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
