config.load_autoconfig()
# User Config
# Start pages and search engines
c.url.start_pages = ["https://www.google.com/"]
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?hl=en&q={}','aw': 'https://wiki.archlinux.org/?search={}', 'yt': 'https://youtube.com/results?search_query={}', 'w': 'https://en.wikipedia.org/?search={}'}

# HINTS
c.hints.chars = 'asdfghjklweroiumvcp'
c.hints.uppercase = True 
c.keyhint.delay = 1

# Tabs related
c.tabs.new_position.unrelated = "next"
config.bind('L', 'tab-next', mode='normal')
config.bind('H', 'tab-prev', mode='normal')
config.bind('J', 'back', mode='normal')
config.bind('K', 'forward', mode='normal')

# Settings
c.confirm_quit = ["always"]
c.content.developer_extras = True
c.scrolling.smooth = True
c.content.user_stylesheets = "/home/instincts/darculized-everything-css/css/darculized/darculized-all-sites.css"

# Fonts
# c.fonts.monospace = "Italic Source Code Pro for Powerline"
# c.fonts.completion.entry = "10pt Source Code Pro for Powerline"
# c.fonts.completion.category = "bold 10pt Source Code Pro for Powerline"
# c.fonts.debug_console = "10pt Source Code Pro for Powerline"
# c.fonts.downloads = "10pt Source Code Pro for Powerline"
# c.fonts.hints = "bold 13px Source Code Pro for Powerline"
# c.fonts.keyhint = "10pt Source Code Pro for Powerline"
# c.fonts.messages.error = "10pt Source Code Pro for Powerline"
# c.fonts.messages.info = "10pt Source Code Pro for Powerline"
# c.fonts.messages.warning = "10pt Source Code Pro for Powerline"
# c.fonts.prompts = "10pt Source Code Pro for Powerline"
# c.fonts.statusbar = "10pt Source Code Pro for Powerline"
# c.fonts.tabs = "10pt Source Code Pro for Powerline"
# c.fonts.web.family.fixed = "Source Code Pro for Powerline"
# c.fonts.web.family.sans_serif = "Source Code Pro for Powerline"
# c.fonts.web.family.serif = "Source Code Pro for Powerline"
