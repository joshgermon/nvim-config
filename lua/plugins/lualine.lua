return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")

			-- Get colors from current colorscheme highlights
			local function get_hl_color(name, attr)
				local hl = vim.api.nvim_get_hl(0, { name = name })
				return hl[attr] and string.format("#%06x", hl[attr]) or nil
			end

			-- Mode colors based on current theme
			local mode_color = {
				n = function() return get_hl_color("Function", "fg") or "#7d97ad" end,
				i = function() return get_hl_color("String", "fg") or "#8c9c7c" end,
				v = function() return get_hl_color("Keyword", "fg") or "#c48282" end,
				V = function() return get_hl_color("Keyword", "fg") or "#c48282" end,
				["\22"] = function() return get_hl_color("Keyword", "fg") or "#c48282" end,
				c = function() return get_hl_color("Type", "fg") or "#e8b589" end,
				no = function() return get_hl_color("Error", "fg") or "#c48282" end,
				s = function() return get_hl_color("Constant", "fg") or "#e8b589" end,
				S = function() return get_hl_color("Constant", "fg") or "#e8b589" end,
				["\19"] = function() return get_hl_color("Constant", "fg") or "#e8b589" end,
				ic = function() return get_hl_color("Constant", "fg") or "#e8b589" end,
				R = function() return get_hl_color("Error", "fg") or "#c48282" end,
				Rv = function() return get_hl_color("Error", "fg") or "#c48282" end,
				cv = function() return get_hl_color("Error", "fg") or "#c48282" end,
				ce = function() return get_hl_color("Error", "fg") or "#c48282" end,
				r = function() return get_hl_color("Special", "fg") or "#b4d4cf" end,
				rm = function() return get_hl_color("Special", "fg") or "#b4d4cf" end,
				["r?"] = function() return get_hl_color("Special", "fg") or "#b4d4cf" end,
				["!"] = function() return get_hl_color("Error", "fg") or "#c48282" end,
				t = function() return get_hl_color("Error", "fg") or "#c48282" end,
			}

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}

			local config = {
				options = {
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					theme = {
						normal = {
							a = { bg = "#000000" },
							b = { bg = "#000000" },
							c = { bg = "#000000" },
							x = { bg = "#000000" },
							y = { bg = "#000000" },
							z = { bg = "#000000" },
						},
						insert = {
							a = { bg = "#000000" },
							b = { bg = "#000000" },
							c = { bg = "#000000" },
							x = { bg = "#000000" },
							y = { bg = "#000000" },
							z = { bg = "#000000" },
						},
						visual = {
							a = { bg = "#000000" },
							b = { bg = "#000000" },
							c = { bg = "#000000" },
							x = { bg = "#000000" },
							y = { bg = "#000000" },
							z = { bg = "#000000" },
						},
						replace = {
							a = { bg = "#000000" },
							b = { bg = "#000000" },
							c = { bg = "#000000" },
							x = { bg = "#000000" },
							y = { bg = "#000000" },
							z = { bg = "#000000" },
						},
						command = {
							a = { bg = "#000000" },
							b = { bg = "#000000" },
							c = { bg = "#000000" },
							x = { bg = "#000000" },
							y = { bg = "#000000" },
							z = { bg = "#000000" },
						},
						inactive = {
							a = { bg = "#000000" },
							b = { bg = "#000000" },
							c = { bg = "#000000" },
							x = { bg = "#000000" },
							y = { bg = "#000000" },
							z = { bg = "#000000" },
						},
					},
					disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "lazy", "mason" },
					always_divide_middle = true,
					globalstatus = true,
				},
				sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			}

			local function ins_left(component)
				table.insert(config.sections.lualine_c, component)
			end

			local function ins_right(component)
				table.insert(config.sections.lualine_x, component)
			end

			local function ins_bottom_right(component)
				table.insert(config.sections.lualine_z, component)
			end

			-- Mode indicator (n/i/v)
			ins_left({
				function()
					return vim.fn.mode()
				end,
				color = function()
					local color_fn = mode_color[vim.fn.mode()]
					return { fg = color_fn and color_fn() or "#7d97ad", gui = "bold" }
				end,
				padding = { left = 1, right = 1 },
			})

			-- Git branch
			ins_left({
				"branch",
				icon = "",
				color = function()
					return { fg = get_hl_color("Comment", "fg") or "#606079", gui = "bold" }
				end,
				padding = { left = 1, right = 1 },
			})

			-- Filename (just filename, no path)
			ins_left({
				"filename",
				cond = conditions.buffer_not_empty,
				color = function()
					return { fg = get_hl_color("Normal", "fg") or "#cdcdcd", gui = "bold" }
				end,
				path = 0,
				symbols = {
					modified = " ●",
					readonly = " ",
					unnamed = "",
				},
				padding = { left = 1, right = 1 },
			})

			-- Diagnostics on right side
			ins_right({
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = "", warn = "", info = "", hint = "" },
				diagnostics_color = {
					error = function() return { fg = get_hl_color("DiagnosticError", "fg") or "#c48282" } end,
					warn = function() return { fg = get_hl_color("DiagnosticWarn", "fg") or "#e8b589" } end,
					info = function() return { fg = get_hl_color("DiagnosticInfo", "fg") or "#b4d4cf" } end,
					hint = function() return { fg = get_hl_color("DiagnosticHint", "fg") or "#8c9c7c" } end,
				},
				padding = { left = 1, right = 1 },
			})

			-- Cursor location (line:column)
			ins_right({
				function()
					local line = vim.fn.line(".")
					local col = vim.fn.col(".")
					return string.format("%d:%d", line, col)
				end,
				color = function()
					return { fg = get_hl_color("Normal", "fg") or "#cdcdcd" }
				end,
				padding = { left = 1, right = 1 },
			})

			-- Progress through file (percentage)
			ins_right({
				"progress",
				color = function()
					return { fg = get_hl_color("Comment", "fg") or "#606079" }
				end,
				padding = { left = 0, right = 1 },
			})

			lualine.setup(config)
		end,
	},
}
