Player = Tiles:extend()

function Player:new(x, y)
  Player.super.new(self, x, y)
  self.speed = 300
end

function Player:update(dt)
  
  if love.keyboard.isDown("right") then
    self.x = self.x + self.speed * dt
  elseif love.keyboard.isDown("left") then
    self.x = self.x - self.speed * dt
  end
  
  Player.super.update(self, dt)
end

function Player:checkColisionWithPlayBorder(e)
  if Player.super.invertedCheckColision(self, e) then
    if self.width > e.width then
      self.x = self.x - (self.width - e.width)
    elseif self.x < e.x then
      self.x = self.x + (e.x - self.x)
    end
  end
end

