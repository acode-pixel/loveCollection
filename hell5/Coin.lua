Coin = Object:extend()


function Coin:new()
  self.x = love.math.random(50, 650)
  self.y = love.math.random(50, 650)
  self.size = 10
  self.image = love.graphics.newImage("dollar.png")
end

function drawCoins(coins)
  for i,v in ipairs(coins) do
    love.graphics.circle("line", v.x, v.y, v.size)
    love.graphics.draw(v.image, v.x, v.y, 0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
  end
end