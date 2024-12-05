return {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = {
        preserve_window_proportions = true,
        width = 30,
        side = "left",
      },
      renderer = {
        root_folder_label = false,
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
        ignore = false
      },
    })
  end,
}
