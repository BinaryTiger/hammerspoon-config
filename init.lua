-- TODO: Move this to a module 
-- Make iTerm take half the screen (from top) on the main screen
-- Press again to hide
hs.hotkey.bind({"ctrl"}, "return", function()
  local term = hs.application.find("iTerm2")
  local termWin = term:mainWindow()
  local termFrame = termWin:frame()
  local screen = hs.screen.allScreens()[1]
  local max = screen:frame()

  if term:isFrontmost() then
    term:hide()
  else
    termFrame.x = 0
    termFrame.y = 0
    termFrame.w = max.w
    termFrame.h = max.h / 2
    termWin:setFrame(termFrame)
    termWin:focus()
  end
end)

-- Lock screen
hs.hotkey.bind({"ctrl"}, "L", function()
  hs.caffeinate.lockScreen()
end)
