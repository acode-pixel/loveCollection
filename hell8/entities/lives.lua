return function()
  local windowLength, windowHeight = love.window.getMode()
  
  local entity = {}
  
  function entity:draw()
    love.graphics.print({state.pallete[4], "LIVES:" .. state.lives}, 700, 0, 0, 2, 2)
  end
  
  return entity
end