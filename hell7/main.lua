function love.load()
  Object = require "classic"
  lume = require "lume"
  require "Entity"
  require "Tiles"
  require "Player"
  require "Ball"
  playArea = {}
  tiles = {}
  objects = {}
  playerStartingCords = {}
  playArea.x, playArea.y = 80, 70
  playArea.drawWidth = 640
  playArea.drawHeight = 460
  playArea.width = playArea.x + playArea.drawWidth
  playArea.height = playArea.y + playArea.drawHeight
  playerStartingCords.x = playArea.drawWidth/2+50
  playerStartingCords.y = playArea.drawHeight*0.97
  
  table.insert(objects, Player(playArea.drawWidth/2+50, playArea.drawHeight*0.97))
  table.insert(objects, Ball(playerStartingCords.x, playerStartingCords.y-100, 18))
  
  tilemap = {
    {1,1,1,1,1,1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1,1,1,1,1,1},
    {2,2,2,2,2,2,2,2,2,2,2,2,2},
    {2,2,2,2,2,2,2,2,2,2,2,2,2},
    {3,3,3,3,3,3,3,3,3,3,3,3,3},
    {3,3,3,3,3,3,3,3,3,3,3,3,3},
    {4,4,4,4,4,4,4,4,4,4,4,4,4},
    {4,4,4,4,4,4,4,4,4,4,4,4,4},
  }
  
  colors = {
    {1,0,0},
    {0,1,0},
    {0,0,1},
    {1,0,1},
  }
  
  for i,v in ipairs(tilemap) do
    for e,d in ipairs(v) do
      if d ~= 0 then
        table.insert(tiles, Tiles((e*playArea.x - (e-1)*35) + 25, (i*playArea.y - (i-1)*60) + 30, colors[d]))
      end
    end
  end
end

function love.update(dt)
    for i,v in ipairs(objects) do
      v:update(dt)
      v:checkColisionWithPlayBorder(playArea)
    end
end

function love.draw()
  love.graphics.rectangle("line", playArea.x, playArea.y, playArea.drawWidth, playArea.drawHeight)
  for i,v in ipairs(tiles) do
    v:draw()
  end
  for i,v in ipairs(objects) do
    v:draw()
  end
end