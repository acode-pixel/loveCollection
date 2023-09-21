

return function()
  local windowLength, windowHeight = love.window.getMode()
  
  local entity = {}
  
  function entity.draw()
    if state.paused then
      love.graphics.print({state.pallete[3], "PAUSED"}, math.floor(windowLength / 2) - 54, math.floor(windowHeight / 2)*0.80, 0, 2, 2)
    end
  end
  
  return entity
end