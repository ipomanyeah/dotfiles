return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = {
          [[
                                       __         
                                      /\ \        
             ___ ___     ____     _ __\ \ \___    
           /' __` __`\  /',__\   /\`'__\ \  _ `\  
           /\ \/\ \/\ \/\__, `\__\ \ \/ \ \ \ \ \ 
           \ \_\ \_\ \_\/\____/\_\\ \_\  \ \_\ \_\
            \/_/\/_/\/_/\/___/\/_/ \/_/   \/_/\/_/

               Cậu vàng đi đời rồi ông giáo ạ !
          ]],
        },
      },
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
