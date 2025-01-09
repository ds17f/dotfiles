return {
  { -- Autoformat
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
          -- require("conform").formatters.prettier_markdown = vim.deepcopy(require("conform.formatters.prettier"))
          -- require("conform").formatters.prettier_markdown.prepend_args =
          --   { "--prose-wrap", "always", "--print-width", "80" }
        end,
        mode = "",
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = true,
      -- format_on_save = function(bufnr)
      --   -- Disable "format_on_save lsp_fallback" for languages that don't
      --   -- have a well standardized coding style. You can add additional
      --   -- languages here or re-enable it for the disabled ones.
      --   local disable_filetypes = { c = true, cpp = true }
      --   return {
      --     timeout_ms = 500,
      --     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      --   }
      -- end,
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        html = { "djlint" },
        go = { "gofmt", "goimports" },
        c = { "clang_format" },
        -- Conform can also run multiple formatters sequentially
        python = { "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { "prettier" },
        typescript = { "prettier" },
        markdown = { "prettier" },
        -- markdown = { "prettier_markdown" },
      },
      formatters = {
        clang_format = {
          prepend_args = { "--style=file", "--fallback-style=LLVM" },
        },
        shfmt = {
          prepend_args = { "-i", "4" },
        },
        -- prettier_markdown = {
        prettier = {
          prepend_args = { "--print-width", "80", "--prose-wrap", "always" },
        },
      },
    },
  },
}
