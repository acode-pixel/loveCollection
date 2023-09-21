entityManager = class("entityManager")

function entityManager:initialize()
  world = GameScene.world
  local entities = require.tree("entities")

  local map = {
    {1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1}
  }

  self.entityList = { 
    entities.paddle(400, 570),
    entities.ball(400, 450),
    entities.pause(),
    entities.lives(),
    gameOver(),
    Score(),
    entities.ground()
  }
  

  for i,v in ipairs(map) do
    for e,d in ipairs(v) do
      if d == 1 then
        table.insert(self.entityList, #self.entityList, entities.brick(100*e, 100*i))
      end
    end
  end
  
end

function entityManager:update(dt)
  local hasBricks = false
  for i = #self.entityList,1,-1 do
    if self.entityList[i].type == "brick" and not hasBricks then hasBricks = true end
    if self.entityList[i].update then self.entityList[i]:update(dt) end
    if self.entityList[i].health == 0 then
      self.entityList[i].fixture:destroy()
      table.remove(self.entityList, i)
    end
  end
  state.stageCleared = not hasBricks
end

function entityManager:draw()
  for _,entity in ipairs(self.entityList) do
    if entity.draw then entity:draw() end
  end
end