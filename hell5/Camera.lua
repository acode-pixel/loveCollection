Camera = Object:extend()
width = 800
height = 600

-- Creates Camera object
function Camera:new(x, y)
  self.x = x
  self.y = y
  self.focus_enable = false
  self.shakeDuration = 0
  self.shakeOffset = {x = 0, y = 0}
  self.movable = false
end
-- shakes camera for t seconds
function Camera:shake(t)
  
  self.shakeDuration = t
  self.shakeWait = 0
  self.shakeOffset = {x = 0, y = 0}
end
-- updates camera shakiness
function Camera:update(dt)
  
  if self.shakeDuration > 0 then
    self.shakeDuration = self.shakeDuration - dt
    if self.shakeWait > 0 then
      self.shakeWait = self.shakeWait - dt
    else 
      self.shakeOffset.x = love.math.random(-5, 5)
      self.shakeOffset.y = love.math.random(-5, 5)
      self.shakeWait = 0.05
    end
  end
end

function Camera:focus(x1, y1)
  if self.focus_enable then
    love.graphics.translate(-x1 + (width/2), -y1 + (height/2))
  end
end

function Camera:draw()
  if self.shakeDuration > 0 then
    love.graphics.translate(self.shakeOffset.x, self.shakeOffset.y)
  end
  if not self.focus_enable or self.movable then 
    love.graphics.translate(self.x, self.y)
  end
end