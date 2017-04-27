-- TODO: Move this to a module 
-- Make iTerm take half the screen (from top) on the main screen
-- Press again to hide
-- TODO: Make it start iTerm if not already started NOT WORKING
-- TODO: Spawn a window if iTerm is started with no window
hs.hotkey.bind({"ctrl"}, "return", function()
  local term = hs.application.find("iTerm2")

  if term == nil then
       term = hs.application.open("iTerm", 0, true)
  end

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

-- TODO: Move this to a module
-- Lock screen
hs.hotkey.bind({"ctrl"}, "L", function()
  hs.caffeinate.lockScreen()
end)
