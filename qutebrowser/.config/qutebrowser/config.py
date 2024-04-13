config.load_autoconfig(False)

c.tabs.background = True
c.downloads.position = 'bottom'

c.colors.webpage.preferred_color_scheme = 'dark'

myFont = '9pt JetBrainsMono Nerd Font'
c.fonts.completion.category = myFont
c.fonts.completion.entry = myFont
c.fonts.contextmenu = myFont
c.fonts.downloads = myFont
c.fonts.hints = myFont
c.fonts.keyhint = myFont
c.fonts.messages.error = myFont
c.fonts.messages.info = myFont
c.fonts.messages.warning = myFont
c.fonts.prompts = myFont
c.fonts.statusbar = myFont
c.fonts.tabs.selected = myFont
c.fonts.tabs.unselected = myFont

c.statusbar.show = 'in-mode'

c.downloads.location.directory = '/home/adel/downloads'

config.source('gruvbox.py')
