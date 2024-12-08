return {
	"echasnovski/mini.comment",
	version = "*",
	config = function()
		require("mini.comment").setup()
		-- override commentstring for c-like filetypes
		vim.api.nvim_create_autocmd("Filetype", {
			pattern = { "c", "cpp", "java", "javascript" },
			callback = function()
				vim.bo.commentstring = "// %s"
			end,
		})
	end,
}
