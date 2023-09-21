
return function(x, y)
  local entity = {}
  entity.body = love.physics.newBody(world, x, y, "static")
  entity.shape = love.physics.newRectangleShape(50, 20)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
  entity.health = 2
  entity.type = "brick"
  entity.fixture:setUserData(entity)
  
  function entity:draw()
    love.graphics.setColor(state.pallete[entity.health] or state.pallete[5])
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
  end
  
  function entity:endContact()
    self.health = self.health - 1
    if self.health == 0 then
      AudioController:play("brickdeath")
    end
  end
  
  return entity
end