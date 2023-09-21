local input = {}
local state = require "state"

-- Map specific keys with functions
local pressFunctions = {}
local releaseFunctions = {}


function input.press(key)
  if pressFunctions[key] then
    pressFunctions[key]()
  end
end

function input.release(key)
  if releaseFunctions[key] then
    releaseFunctions[key]()
  end
end

function input.toggleFocus(focused)
  if not focused then
    state.paused = true
  end
end

function input.mousepress(x, y)
  state.mouse = true
end

function input.mouserelease()
  state.mouse = false
end

function pressFunctions.left()
  state.left = true
end

function pressFunctions.right()
  state.right = true
end

function pressFunctions.escape()
  love.event.quit()
end

function pressFunctions.space()
  state.space = true
  if state.gameOver or state.stageCleared then
    return
  end
  state.paused = not state.paused
end

function releaseFunctions.left()
  state.left = false
end

function releaseFunctions.right()
  state.right = false
end

function releaseFunctions.space()
  state.space = false
end

return input

