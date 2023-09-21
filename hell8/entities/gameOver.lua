gameOver = class("gameOver")
function gameOver:initialize()
  
  self.windowLength, self.windowHeight = love.window.getMode()
end

function gameOver:update(dt)
  
  if state.stageCleared and not state.fastestTime then
    state.fastestTime = tonumber(state.currentScore)
  elseif state.stageCleared and state.fastestTime > tonumber(state.currentScore) then
    state.fastestTime = tonumber(state.currentScore)
  end
  
  if state.space and (state.gameOver or state.stageCleared) then
    GameScene:destroy()
    package.loaded["../world"] = false
    currentScene = startScreen:new()
  end
end
  
function gameOver:draw()
  
  if state.gameOver or state.stageCleared then
    love.graphics.print({state.pallete[5], "GAME OVER"}, math.floor(self.windowLength / 2) - 74, math.floor(self.windowHeight / 2)*0.80, 0, 2, 2)
    love.graphics.print({state.pallete[5], "Press SPACE to go to menu"}, math.floor(self.windowLength / 2) - 124, math.floor(self.windowHeight / 2)*1.10, 0, 1.5, 1.5)
    if state.gameOver then
      AudioController:play("GameOver")
    else
      AudioController:play("stagecleared")
    end
  end
end