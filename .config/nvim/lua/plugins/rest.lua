return {
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		config = function()
			local ok, rest = pcall(require, "rest-nvim")
			if not ok then
				return
			end
			rest.setup(
				{
					client = "curl",
					env_file = ".env.development.local",
					env_pattern = "\\.env$",
					encode_url = true,
					skip_ssl_verification = false,
					custom_dynamic_variables = {},
					logs = {
						level = "info",
						save = "true",
					},
					result = {
						split = {
							horizontal = false,
							in_place = false,
							stay_in_current_window_after_split = true,
						},
						behavior = {
							decode_url = true,
							show_info = {
								url = true,
								headers = true,
								http_info = true,
								curl_command = true,
							},
							statistics = {
								enable = true,
								stats = {
									{ "total_time", title = "Time taken:" },
									{ "size_download_t", title = "Download size:" },
								},
							},
							formatters = {
								json = "jq",
								html = function(body)
									return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
								end,
							},
						},
					},
					highlight = {
						enable = true,
						timeout = 750,
					},
				},
				vim.api.nvim_create_autocmd("FileType", {
					pattern = "http",
					callback = function()
						local buff = tonumber(vim.fn.expand("<abuf>"), 10)
						vim.keymap.set("n", "<leader>rr", rest.run, { noremap = true, buffer = buff })
						vim.keymap.set("n", "<leader>rl", rest.last, { noremap = true, buffer = buff })
						vim.keymap.set("n", "<leader>rp", function()
							rest.run(true)
						end, { noremap = true, buffer = buff })
					end,
				})
			)
		end,
	},
}
