local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

math.randomseed(os.time())

local plugins = ""
if vim.fn.has("linux") == 1 or vim.fn.has("mac") == 1 then
  local handle = io.popen('fd -d 1 . $HOME"/.local/share/nvim/plugged" | wc -l | tr -d "\\n" ')
  if handle == nil then
    return nil
  end
  plugins = handle:read("*a")
  handle:close()

  plugins = plugins:gsub("^%s*(.-)%s*$", "%1")
else
  plugins = "N/A"
end

local function pick_color()
  local colors = { "String", "Identifier", "Keyword", "Number" }
  return colors[math.random(#colors)]
end

local function footer()
  local total_plugins = plugins
  local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
  local version = vim.version()
  local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

  return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
end

local header = {
  "   ",
  "   /\\\\\\        /\\\\\\                /\\\\\\                               ",
  "   \\/\\\\\\       \\/\\\\\\               \\/\\\\\\                              ",
  "    \\/\\\\\\       \\/\\\\\\               \\/\\\\\\                             ",
  "     \\/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\     /\\\\\\\\\\    \\/\\\\\\             /\\\\\\\\\\         ",
  "      \\/\\\\\\/////////\\\\\\   /\\\\\\///\\\\\\  \\/\\\\\\\\\\\\\\\\\\\\    /\\\\\\///\\\\\\      ",
  "       \\/\\\\\\       \\/\\\\\\  /\\\\\\  \\//\\\\\\ \\/\\\\\\/////\\\\\\  /\\\\\\  \\//\\\\\\    ",
  "        \\/\\\\\\       \\/\\\\\\ \\//\\\\\\  /\\\\\\  \\/\\\\\\   \\/\\\\\\ \\//\\\\\\  /\\\\\\    ",
  "         \\/\\\\\\       \\/\\\\\\  \\///\\\\\\\\\\/   \\/\\\\\\   \\/\\\\\\  \\///\\\\\\\\\\/    ",
  "          \\///        \\///     \\/////     \\///    \\///     \\/////     ",
  "   ",
}

-- Set menu
local button = {
  dashboard.button("r", "  Recent File", ":Telescope oldfiles<CR>"),
  dashboard.button("p", "  Project", ":Telescope project<CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find file", ":Telescope find_files hidden=true<CR>"),
  dashboard.button("l", "  Bookmark", ":Telescope marks<CR>"),
  dashboard.button("u", "  Update Plugin", ":PlugUpdate | :CocUpdate<CR>"),
  dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

dashboard.section.header.val = header
dashboard.section.header.opts.hl = pick_color()
dashboard.section.buttons.val = button
dashboard.section.footer.val = footer()

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
    autocmd FileType alpha set conceallevel=0
]])
