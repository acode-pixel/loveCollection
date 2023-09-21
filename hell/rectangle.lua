Rectangle = Shape:extend() -- Makes "Rectangle" a copy of "Shape"

function Rectangle:new(x, y, width, height, mode, speed)
  Rectangle.super.new(self, x, y, mode, speed) -- Call function form base class "Shape"
  self.width  = width
  self.height  = height
  --print(self.mode)
end

function Rectangle:draw()
  love.graphics.rectangle(self.mode, self.x, self.y, self.width, self.height)
end

function Rectangle:checkCollision(b)
  local a_left = self.x
  local a_right = self.x + self.width
  local a_top = self.y
  local a_bottom = self.y + self.height
  
  local b_left = b.x
  local b_right = b.x + b.width
  local b_top = b.y
  local b_bottom = b.y + b.height
  
  return a_right > b_left and a_left < b_right and a_bottom > b_top and a_top < b_bottom
end