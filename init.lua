-- Tile window left
hs.hotkey.bind({"cmd", "shift"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Tile window right
hs.hotkey.bind({"cmd", "shift"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Toggle focused window fullscreen
hs.hotkey.bind({"cmd", "shift"}, "f", function()
  local win = hs.window.focusedWindow()
  win:toggleFullScreen()  
end)

-- Maximize focused window
hs.hotkey.bind({"cmd", "shift"}, "m", function()
  local win = hs.window.focusedWindow()
  win:maximize(0)
end)

-- Toggle focused window minimize
hs.hotkey.bind({"cmd", "shift"}, "n", function()  
  local win = hs.window.focusedWindow()
  win:minimize()
  --local windowIsMinimized = win:isMinimized()
  
  --if windowIsMinimized == true then
  --  win:unminimize()
  --else
  --  win:minimize()
  --end
end)

-- Setup window filter
switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{}) -- include minimized/hidden windows, current Space only

-- Cycle right through windows on space
hs.hotkey.bind({"cmd", "alt"}, "Right", function()
  switcher_space.ui.showTitles = false
  switcher_space.ui.showThumbnails = false
  hs.window.switcher.ui.showSelectedThumbnail = false
  hs.window.switcher.ui.showSelectedTitle = false
  hs.window.animationDuration = 0
  switcher_space:next()
end)

-- Cycle left through windows on space
hs.hotkey.bind({"cmd", "alt"}, "Left", function()
  switcher_space.ui.showTitles = false
  switcher_space.ui.showThumbnails = false
  hs.window.switcher.ui.showSelectedThumbnail = false
  hs.window.switcher.ui.showSelectedTitle = false
  hs.window.animationDuration = 0
  switcher_space:previous()
end)

-- Move window to other screen
hs.loadSpoon("WindowScreenLeftAndRight")
spoon.WindowScreenLeftAndRight:bindHotkeys(spoon.WindowScreenLeftAndRight.defaultHotkeys)

-- Automatically reload config
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
