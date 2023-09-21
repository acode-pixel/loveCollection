function love.load()
  
  image = love.graphics.newImage("tileset.png")
  image_width = image:getWidth()
  image_height = image:getHeight()
  
  quads = {}
  
  width = (image_width / 3) - 2
  height = (image_height / 2) - 2
  
  for i=0,1 do
    for d=0,2 do
      table.insert(quads, love.graphics.newQuad(
          1 + d * (width + 2), 
          1 + i * (height + 2), 
          width, 
          height, 
          image_width, image_height))
    end
  end
  
  tilemap = {
      {1, 6, 6, 2, 1, 6, 6, 2},
      {3, 0, 0, 4, 5, 0, 0, 3},
      {3, 0, 0, 0, 0, 0, 0, 3},
      {4, 2, 0, 0, 0, 0, 1, 5},
      {1, 5, 0, 0, 0, 0, 4, 2},
      {3, 0, 0, 0, 0, 0, 0, 3},
      {3, 0, 0, 1, 2, 0, 0, 3},
      {4, 6, 6, 5, 4, 6, 6, 5}
  }
  
  player = {
      image = love.graphics.newImage("player.png"),
      tile_x = 2,
      tile_y = 2
    }
end

function love.keypressed(key)
  
  local x = player.tile_x
  local y = player.tile_y
  
  if key == "right" then
    x = x + 1
  
  elseif key == "left" then
    x = x - 1
  
  elseif key == "up" then
    y = y - 1
  
  elseif key == "down" then
    y = y + 1
  end
  
  if tilemap[y][x] == 0 then
    player.tile_x, player.tile_y = x, y
  end
end

function love.update(dt)
  
end

function love.draw()
  for i,v in ipairs(tilemap) do
    for d,e in ipairs(v) do
      if e ~= 0 then
        love.graphics.draw(image, quads[e], d * width, i * height)
      end
    end
  end
  love.graphics.draw(player.image, player.tile_x * width, player.tile_y * height)
end