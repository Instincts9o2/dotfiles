config.load_autoconfig()


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


# SCROLLING
c.scrolling.smooth = True


c.confirm_quit = ["always"]

c.content.developer_extras = True
c.colors.webpage.bg = "black"

c.content.user_stylesheets = "~/solarized-everything-css/css/solarized-all-sites-dark.css"
