Circle = Shape:extend() -- Makes "Circle" a copy of "Shape"

function Circle:new(x, y, radius)
  Circle.super.new(self, x, y) -- Call function form base class "Shape"
  self.radius = radius
end

function Circle:draw()
  love.graphics.circle("line", self.x, self.y, self.radius)
end