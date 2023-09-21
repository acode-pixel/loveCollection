Score = class("Score")

function Score:initialize()
  self.counter = love.timer.getTime()
  state.currentScore = 0
  self.windowLength, self.windowHeight = love.window.getMode()
end

function Score:update(dt)
  state.currentScore = string.format("%2.2f", (love.timer.getTime() - self.counter))
end

function Score:draw()
  love.graphics.print({state.pallete[3], "TIME: " .. tonumber(state.currentScore)}, self.windowLength/2, 0, 0, 2, 2)
end