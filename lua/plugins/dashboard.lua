return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          "                      ",
          "                      ",
          "                      ",
          "                      ",
          "                      ",
          "                      ",
          "                      ",
          "                      ",
          "                      ",
          "                      ",
          " ███╗   ██╗ ██╗   ██╗ ",
          " ████╗  ██║ ██║   ██║ ",
          " ██╔██╗ ██║ ██║   ██║ ",
          " ██║╚██╗██║ ╚██╗ ██╔╝ ",
          " ██║ ╚████║  ╚████╔╝  ",
          " ╚═╝  ╚═══╝   ╚═══╝   ",
          "                      ",
          "                      ",
          "                      ",
          "                      ",
        },
        center = {
          { icon = "📂 ", desc = "  Find File", action = "Telescope find_files", key = "f" },
          { icon = "🔍 ", desc = "  Find Word", action = "Telescope live_grep", key = "g" },
          { icon = "📑 ", desc = "  Recent Files", action = "Telescope oldfiles", key = "r" },
          { icon = "🛠 ", desc = "  Mason Packages", action = "Mason", key = "m" },
          { icon = "❌ ", desc = "  Quit Neovim", action = "qa", key = "q" },
        },
        footer = { "🚀 Neovim is ready! Happy coding, NAGA VAMSI! 🎯" },
      },
      hide = { statusline = false, tabline = false, winbar = false },
    })

    -- Center the Dashboard
    vim.api.nvim_command("highlight DashboardHeader guifg=#61afef gui=bold") -- Header color
    vim.api.nvim_command("highlight DashboardCenter guifg=#98c379 gui=bold") -- Center text color
    vim.api.nvim_command("highlight DashboardFooter guifg=#e06c75 gui=bold") -- Footer color
  end,
}
