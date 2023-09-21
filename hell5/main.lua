function love.load()
  
  lume = require "lume"
  Object = require "classic"
  require "Player"
  require "Coin"
  require "Camera"
  camera = Camera(0, 0)
  player = Player(100, 100)
  coins = {}
  score = 0
  
  if love.filesystem.getInfo("savedata.txt") then
    file = love.filesystem.read("savedata.txt")
    data = lume.deserialize(file)
    
    player.x, player.y = data.player.x, data.player.y
    player.size = data.player.size
    
    for i,v in ipairs(data.coins) do
      coins[i] = {
        x = v.x,
        y = v.y,
        size = 10,
        image = love.graphics.newImage("dollar.png")
        }
    end
  
  else
    for _=1,love.math.random(10, 70) do
      table.insert(coins, Coin())
    end
  end
end

function saveGame()
  
  data = {}
  data.player = {
    x = player.x,
    y = player.y,
    size = player.size
  }
  data.coins = {}
  
  for i,v in ipairs(coins) do
    data.coins[i] = {x = v.x, y = v.y}
  end
  serialized = lume.serialize(data)
  love.filesystem.write("savedata.txt", serialized)
end

function love.keypressed(key)
  
  if key == "s" then
    saveGame()
  elseif key == "r" then
    love.filesystem.remove("savedata.txt")
    love.event.quit("restart")
  end
  
  if key == "f" then
    camera.focus_enable = not camera.focus_enable
  elseif key == "c" then
    camera.movable = not camera.movable
  end

  if camera.movable then
    if key == "right" then
      camera.x = camera.x + width
    elseif key == "left" then
    camera.x = camera.x - width
    elseif key == 'up' then
      camera.y = camera.y + height
    elseif key == "down" then
      camera.y = camera.y - height
    end
  end
  
end

function love.update(dt)
  if not camera.movable then
    player:update(dt)  
  end

  for i=#coins,1,-1 do
    if player:checkCircleColission(coins[i]) then
      table.remove(coins, i)
      player.size = player.size + 1
      score = score + 1
      camera:shake(0.3)
    end
  end
  
  camera:update(dt)
end

function love.draw()
  love.graphics.push()

  camera:focus(player.x, player.y)
  camera:draw()
  player:draw()
  drawCoins(coins)
  
  love.graphics.pop()
  love.graphics.print(score, 10, 10)
end