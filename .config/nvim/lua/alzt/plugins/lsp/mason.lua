local status_ok, mason = pcall(require, "mason")
local status_ok, lspconfig = pcall(require, "mason-lspconfig")

if not status_ok then
	return
end

local servers = {
  "jdtls"
}

mason.setup()

lspconfig.setup({
	ensure_installed = servers
})
