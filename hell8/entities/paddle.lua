
return function(x, y)
  local entity = {}
  local windowLength = love.window.getMode()
  entity.width = 180
  entity.height = 20
  
  local leftBoundary = (entity.width/2) + 2
  local rightBoundary = windowLength - (entity.width/2) - 2

  entity.body = love.physics.newBody(world, x, y, "kinematic")
  entity.shape = love.physics.newRectangleShape(entity.width, entity.height)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
  entity.fixture:setFriction(0)
  entity.speed = 400
  entity.type = "paddle"
  entity.fixture:setUserData(entity)

  function entity:draw()
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
  end
  
  function entity:update(dt)
    if state.left and state.right then return end
    
    self.x = self.body:getX()
    
    if state.left and self.x > leftBoundary then
      self.body:setLinearVelocity(-400, 0)
    elseif state.right and self.x < rightBoundary then
      self.body:setLinearVelocity(400, 0)
    else
      self.body:setLinearVelocity(0, 0)
    end
  end

  return entity
end