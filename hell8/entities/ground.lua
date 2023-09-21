return function()
  local entity = {}
  local ground = {}
  local top = {}

  ground.bottomColliderShape = love.physics.newEdgeShape(0, 600, 801, 600)
  top.topColliderShape = love.physics.newEdgeShape(0, 0, 801, 0)

  entity.body = love.physics.newBody(world, 0, 0, "static")
  entity.shape = love.physics.newChainShape(true, 0, 0, 801, 0, 801, 600, 0, 600)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
  entity.fixture:setFriction(0)
  entity.bottomFixture = love.physics.newFixture(entity.body, ground.bottomColliderShape)
  entity.topFixture = love.physics.newFixture(entity.body, top.topColliderShape)
  entity.fixture:setUserData(entity)
  entity.bottomFixture:setUserData(ground)
  entity.topFixture:setUserData(top)

  function ground:endContact()
    state.lives = state.lives - 1
    if state.lives <= 0 then
      state.gameOver = true
    end
  end
  return entity
end