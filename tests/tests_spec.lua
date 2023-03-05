-- Gets a keymap
local function get_keymap(query)
	local keymaps = vim.api.nvim_get_keymap(query.mode)
	local found
	for _, v in ipairs(keymaps) do
		if v.lhs == query.lhs then
			found = v
		end
	end
	return found
end

describe("Mapper", function()
	describe("map", function()
		it("registers a keymap", function()
			require("nvim-mapper").map("n", "<space>mapper", "echo 'foo'", { noremap = true }, "Test", "Test", "Test")

			local mapper_keymap = get_keymap({ mode = "n", lhs = " mapper" })

			assert.is.truthy(mapper_keymap)
		end)
	end)
end)
