Player = Object:extend()

function Player:new(x, y, size, speed)
  self.x = x
  self.y = y
  self.size = size or 25
  self.speed = speed or 200
  self.image = love.graphics.newImage("face.png")
end

function Player:checkCircleColission(p1)
    local distance = lume.distance(self.x, self.y, p1.x, p1.y)
    return distance < self.size + p1.size
end

function Player:update(dt)
  if love.keyboard.isDown("right") then
    self.x = self.x + self.speed * dt
  elseif love.keyboard.isDown("left") then
    self.x = self.x - self.speed * dt
  end
  
  if love.keyboard.isDown("up") then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown("down") then
    self.y = self.y + self.speed * dt
  end
end

function Player:draw()
  love.graphics.circle("line", self.x, self.y, self.size)
  love.graphics.draw(self.image, self.x, self.y, 0, 1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
end

