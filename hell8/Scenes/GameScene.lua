GameScene = class("GameScene")

function GameScene:initialize()
  love.physics.setMeter(100)
  state:reset()
  
  GameScene.static.world = require "../world"
  require "../entities"
  self.entityManager = entityManager:new()
end

function GameScene:update(dt)
  if state.paused or state.gameOver or state.stageCleared then
    self.entityManager.entityList[5]:update(dt)
    return
  end
  self.entityManager:update(dt)
  GameScene.world:update(dt)
end

function GameScene:draw()
  self.entityManager:draw()
end

function GameScene:destroy()
  GameScene.world:destroy()
  GameScene.world:release()
end
