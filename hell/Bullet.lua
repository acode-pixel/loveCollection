-- Add bullet functionality

Bullet = Rectangle:extend() -- Copies functions from rectangle class

-- Creates bullets
function Bullet:new(x, y, speed, id)
  self.x, self.y = x, y
  self.width, self.height = 20, 50
  self.speed = speed
  self.mode = "fill"
  self.visible = true
end

-- Updates bullet position
function Bullet:update(dt)
  self.y = self.y + self.speed * dt
end

function Bullet:Dissappear(a)
  if Bullet.super.checkCollision(self, a) then
    self.visible = false
    enemy.hit_counter = enemy.hit_counter + 1
  end
  if (self.y + 50) >= 600 then
    Game_Over = true
  end
end

