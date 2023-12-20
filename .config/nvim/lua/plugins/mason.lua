return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function(_, opts)
		vim.print(opts)
		-- import mason
		local mason = require("mason")

		local conf = vim.tbl_deep_extend("keep", opts, {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- enable mason and configure icons
		mason.setup(conf)
		-- import mason-lspconfig
		require("java").setup()
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
				"html",
				"lua_ls",
				"clangd",
				"gopls",
				"pyright",
				"rust_analyzer",
			},
			handlers = {
				["jdtls"] = function()
					require("lspconfig").jdtls.setup({})
				end,
			},
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d", -- js linter
			},
		})
	end,
}
-- return {
-- {
--     "williamboman/mason.nvim",
--     lazy = false,
--     config = function()
--       require("mason").setup()
--     end
--   },
-- {
--     "williamboman/mason-lspconfig.nvim",
--     config = function()
-- local servers = {
--   clangd = {},
--   gopls = {},
--   pyright = {},
--   rust_analyzer = {},
--   tsserver = {},
--   html = { filetypes = { 'html', 'twig', 'hbs' } },
--
--   lua_ls = {
--     Lua = {
--       workspace = { checkThirdParty = false },
--       telemetry = { enable = false },
--     },
--   },
-- }
--
-- -- Setup neovim lua configuration
-- -- require('neodev').setup()
--
-- -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
-- -- Ensure the servers above are installed
-- local mason_lspconfig = require 'mason-lspconfig'
--
-- mason_lspconfig.setup {
--   ensure_installed = vim.tbl_keys(servers),
--
-- }
--
-- mason_lspconfig.setup_handlers {
--   function(server_name)
--     require('lspconfig')[server_name].setup {
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name],
--       filetypes = (servers[server_name] or {}).filetypes,
--     }
--   end
-- }
-- 		end
-- 	}
-- }
