local options = {
	view = {
		side = "right", -- Ubicar nvim-tree a la derecha
		width = 30, -- Puedes ajustar el ancho según tu preferencia
	},
	renderer = {
		group_empty = true, -- Agrupar carpetas vacías
		highlight_git = true, -- Opcional: resaltar archivos según git
		icons = {
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			},
		},
	},
}

require("nvim-tree").setup(options)
