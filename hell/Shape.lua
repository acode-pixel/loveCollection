Shape = Object:extend()

function Shape:new(x, y, mode, speed)
  self.x, self.y, self.mode = x, y, mode, speed
  self.speed = speed or 0
end

function Shape:update(dt)
  self.x = self.x + self.speed * dt
end