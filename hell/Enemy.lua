Enemy = Rectangle:extend()

function Enemy:new(x, y, mode)
  Enemy.super.new(self, x, y, 100, 100, mode)
  self.hit_counter = 0
end

function Enemy:Movement_update()
  if self.x + 100 >= 800 then
    self.speed = -200 - (self.hit_counter * 5)
  end
  if self.x <= 0 then
    self.speed = 200 + (self.hit_counter * 5)
  end
end
