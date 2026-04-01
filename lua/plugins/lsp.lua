return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, blink = pcall(require, "blink.cmp")
      if ok then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buf = args.buf
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, noremap = true, desc = desc })
          end
          map("n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
          map("n", "gr", vim.lsp.buf.references, "LSP: References")
          map("n", "gi", vim.lsp.buf.implementation, "LSP: Implementation")
          map("n", "K", vim.lsp.buf.hover, "LSP: Hover doc")
          map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
          map("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, "LSP: Format")
          map("n", "<leader>e", vim.diagnostic.open_float, "LSP: Diagnostic float")
          map("n", "<leader>k", vim.diagnostic.goto_prev, "LSP: Prev diagnostic")
          map("n", "<leader>j", vim.diagnostic.goto_next, "LSP: Next diagnostic")
        end,
      })

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        cmd = { "clangd", "--offset-encoding=utf-8" },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      vim.lsp.config("jdtls", {
        cmd = { "/opt/homebrew/bin/jdtls" },
        cmd_env = {
          JAVA_HOME = "/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home",
          PATH = vim.env.PATH,
        },
      })

      vim.lsp.enable({ "clangd", "gopls", "jdtls", "lua_ls", "pyright", "ts_ls" })
    end,
  },
}
