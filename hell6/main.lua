function love.load()
  Object = require "classic"
  require "Entity"
  require "Player"
  require "Wall"
  require "box"
  
  player = Player(100, 100)
  box = Box(200, 200)
  objects = {}
  walls = {}
  table.insert(objects, player)
  table.insert(objects, box)
  
  map = {
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
    {1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1},
    {1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1},
    {1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
}
  
  for i,v in ipairs(map) do
    for q,b in ipairs(v) do
      if b == 1 then
        table.insert(walls, Wall((q-1)*50, (i-1)*50))
      end
    end
  end
end

function love.update(dt)
  ---[[
  for i,v in ipairs(objects) do
    v:update(dt)
  end
  
    for i,v in ipairs(walls) do
    v:update(dt)
  end
  
  local loop = true
  local limit = 0
  
  while loop do
    
    loop = false
    limit = limit + 1
    
    if limit > 100 then
      break
    end
    for i=1,#objects-1 do
      for j=i+1,#objects do
        local collision = objects[i]:resolveCollision(objects[j])
        if collision then
          loop = true
        end
      end
    end
    
    for i,wall in ipairs(walls) do
      for j,o in ipairs(objects) do
        local collision = o:resolveCollision(wall)
        if collision then
          loop = true
        end
      end
    end
  end
end

function love.draw()
  for i,v in ipairs(objects) do
    v:draw()
  end
  
    for i,v in ipairs(walls) do
    v:draw()
  end
end

function love.keypressed(key)
  if key == "up" then
    player:jump()
  end
end