Entity = Object:extend()

function Entity:new(x, y, image_path)
  self.x = x
  self.y = y
  self.image = love.graphics.newImage(image_path)
end

function Entity:update(dt)
  self.width = self.x + self.image:getWidth()
  self.height = self.y + self.image:getHeight()
end

function Entity:draw()
  love.graphics.draw(self.image, self.x, self.y)
end

function Entity:checkColision(e)
  return self.width > e.x 
  and self.x < e.width
  and self.height > e.y
  and self.y < e.height
end

function Entity:invertedCheckColision(e)
  return self.x < e.x
  or self.width > e.width
  or self.y < e.y
  or self.height > e.height
end

function Entity:checkIfVerticallyAligned(e)
  if self.width > e.x then
    return "left"
  elseif self.x < e.width then
    return "right"
  end
  return false
end

function Entity:resolveColision(e)
  if self:is(Ball) then
    
  end
end