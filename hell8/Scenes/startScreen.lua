startScreen = class("startScreen")

function startScreen:initialize()
  self.windowLength, self.windowHeight = love.window.getMode()
  
end

function startScreen:update(dt)
  if state.mouse then
    state.paused = false
    currentScene = GameScene:new()
  end
end
  
function startScreen:draw()
  love.graphics.print({{1,1,1,1}, "BREAKOUT"}, (self.windowLength/2)-64, 200, 0, 2, 2)
  love.graphics.print({{1,1,1,1}, "Cick to Start"}, (self.windowLength/2)-54, 250, 0, 1.5, 1.5)
  
  if state.fastestTime then
    love.graphics.print({{1,1,1,1}, "Fastest Time: " .. state.fastestTime}, (self.windowLength/2)-54, 350, 0, 1.5, 1.5)
  end
end