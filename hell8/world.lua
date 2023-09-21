local function endContact(fixture1, fixture2, contact)

  local entity1 = fixture1:getUserData()
  local entity2 = fixture2:getUserData()
  
  if entity1.endContact then entity1:endContact() end
  if entity2.endContact then entity2:endContact() end 
end

local function preSolve(fixture1, fixture2, contact)
  local entity1 = fixture1:getUserData()
  local entity2 = fixture2:getUserData()
  
  if entity1.preSolve then entity1:preSolve(contact) end
  if entity2.preSolve then entity2:preSolve(contact) end 
end

local world = love.physics.newWorld(0, 0, true)

world:setCallbacks(
  nil,
  endContact,
  preSolve,
  nil
  )

return world