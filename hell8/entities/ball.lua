
return function(x, y)
  local entity = {}

  entity.body = love.physics.newBody(world, x, y, "dynamic")
  entity.body:setMass(32)
  entity.body:setLinearVelocity(0, 300*0.45)
  entity.shape = love.physics.newCircleShape(10)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
  entity.fixture:setRestitution(1)
  entity.fixture:setFriction(0)
  entity.fixture:setUserData(entity)
  
  entity.maxSpeed = 880
  entity.type = "ball"

  function entity:draw()
    love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
  end
  
  function entity:update(dt)
    local velx, vely = self.body:getLinearVelocity()
    local speed = math.abs(velx) + math.abs(vely)
    local velxCritical = math.abs(velx) > self.maxSpeed * 2
    local velyCritical = math.abs(vely) > self.maxSpeed * 2
    
    if velxCritical or velyCritical then
      self.body:setLinearVelocity(velx*0.75, vely*0.75)
    end
    
    if speed > self.maxSpeed then
      self.body:setLinearDamping(0.1)
    else
      self.body:setLinearDamping(0)
    end
  end
  
  function entity:preSolve(contact)
    local fixture1, fixture2 = contact:getFixtures()
    local entity1, entity2 = fixture1:getUserData(), fixture2:getUserData()
    local velx, vely = self.body:getLinearVelocity()
    
    local cachedContact = contact
    if entity1.type == "paddle" then
      local x = entity1.body:getLocalPoint(cachedContact:getPositions())
      if x > 40 then
        self.body:setLinearVelocity(300*((x+15)/90), -350*(-(x+15)/90))
      elseif x < -40 then
        self.body:setLinearVelocity(-300*((x-15)/-90), -350*((x-15)/-90))
      end
    end
  end
  
  function entity:endContact()
    AudioController:play("ballBounce")
  end
  
  return entity
end