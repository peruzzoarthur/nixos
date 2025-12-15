-- startify-cats.lua
-- Custom cat images loader for Startify dashboard

local M = {}

function M.setup()
	vim.api.nvim_create_autocmd("User", {
		pattern = "StartifyReady",
		callback = function()
			local image = require("image")
			local briga = "/home/ozzurep/.dotfiles/modules/nixos/nvim/ui/filhos/briga.png"
			local mari = "/home/ozzurep/.dotfiles/modules/nixos/nvim/ui/filhos/maritapada.png"
			local dusi = "/home/ozzurep/.dotfiles/modules/nixos/nvim/ui/filhos/dusi_abismada.png"
			local ddds = "/home/ozzurep/.dotfiles/modules/nixos/nvim/ui/filhos/mercedita.png"

			vim.defer_fn(function()
				-- First image
				if vim.fn.filereadable(briga) == 1 then
					local img1 = image.from_file(briga, {
						window = vim.api.nvim_get_current_win(),
						buffer = vim.api.nvim_get_current_buf(),
						x = 1,
						y = 1,
						width = 30,
						height = 30,
					})
					if img1 then
						img1:render()
					end
				end

				-- Second image
				if vim.fn.filereadable(mari) == 1 then
					local img2 = image.from_file(mari, {
						window = vim.api.nvim_get_current_win(),
						buffer = vim.api.nvim_get_current_buf(),
						x = 30,
						y = 1,
						width = 30,
						height = 30,
					})
					if img2 then
						img2:render()
					end
				end
				-- Third image
				if vim.fn.filereadable(dusi) == 1 then
					local img3 = image.from_file(dusi, {
						window = vim.api.nvim_get_current_win(),
						buffer = vim.api.nvim_get_current_buf(),
						x = 60,
						y = 1,
						width = 25,
						height = 25,
					})
					if img3 then
						img3:render()
					end
				end
				-- Fourth image
				if vim.fn.filereadable(ddds) == 1 then
					local img4 = image.from_file(ddds, {
						window = vim.api.nvim_get_current_win(),
						buffer = vim.api.nvim_get_current_buf(),
						x = 90,
						y = 1,
						width = 25,
						height = 25,
					})
					if img4 then
						img4:render()
					end
				end
			end, 50)
		end,
	})
end

return M
