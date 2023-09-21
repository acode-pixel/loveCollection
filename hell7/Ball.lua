Ball = Entity:extend()

function Ball:new(x, y, radius)
  Ball.super.new(self, x, y, "ball.png")
  self.radius = radius
  self.speed = 200
  self.angle = -20
  self.lastBounceAngle = 0
end

function Ball:update(dt)
  
  Ball.super.update(self, dt)
  local rad = math.rad(self.angle)
  local cos = math.cos(rad)
  local sin = math.sin(rad)
  self.x = self.x + self.speed * cos * dt
  self.y = self.y + self.speed * sin * dt
end

function Ball:checkColisionWithPlayBorder(e)
  if self:invertedCheckColision(e) then
      -- Implement ball bounce
    self.lastBounceAngle = self.angle
    if self.width > e.width then -- ball hits the right border
      self.angle = love.math.random(90, 270) --love.math.random(100, 260)
    elseif self.x < e.x then -- ball hits the left border
      self.angle = love.math.random(100, -90)
    elseif self.height > e.height then -- ball hits the bottom border
      self.angle = love.math.random(10, -170)
    elseif self.y < e.y then -- ball hits the top border
      self.angle = love.math.random(10, 170)
    end
  end
end


