Tiles = Entity:extend()

function Tiles:new(x, y, color)
  Tiles.super.new(self, x, y, "bar.png")
  self.color = color or {1,1,1}
end

function Tiles:draw()
  love.graphics.setColor(self.color)
  Tiles.super.draw(self)
  love.graphics.reset()
end