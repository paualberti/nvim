return {
	"hedyhli/outline.nvim",
	config = function()
		-- Example mapping to toggle outline
		vim.keymap.set("n", "<leader>to", "<cmd>Outline<cr>", { desc = "[T]oggle [O]utline" })

		require("outline").setup({
			-- Your setup opts here (leave empty to use defaults)
		})
	end,
}
