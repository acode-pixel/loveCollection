Entity = Object:extend()

function Entity:new(x, y, image_path)
  self.x = x
  self.y = y
  self.image = love.graphics.newImage(image_path)
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.strength = 0
  self.tempStrength = 0
  self.weight = 400
  self.gravity = 0
  
  self.last = {}
  self.last.x = self.x
  self.last.y = self.y
end

function Entity:update(dt)
  self.last.x = self.x
  self.last.y = self.y
  self.tempStrength = self.strength
  
  self.gravity = self.gravity + self.weight * dt
  self.y = self.y + self.gravity * dt
end

function Entity:draw()
  love.graphics.draw(self.image, self.x, self.y)
end

function Entity:checkCollision(e)
  return self.x + self.width > e.x 
  and self.x < e.x + e.width
  and self.y + self.height > e.y
  and self.y < e.y + e.height
end

function Entity:wasVerticallyAligned(e)
  return self.last.y < e.last.y + e.height and self.last.y + self.height > e.last.y
end

function Entity:wasHorizontallyAligned(e)
  return self.last.x < e.last.x + e.width and self.last.x + self.width > e.last.x
end

function Entity:resolveCollision(e)
    -- Compare the tempStrength
  if self.tempStrength > e.tempStrength then
    -- We need to return the value that this method returns
    -- Else it will never reach main.lua
    ---- ADD THIS
    return e:resolveCollision(self)
        -------------
    end

  if self:checkCollision(e) then
    self.tempStrength = e.tempStrength
    
    if self:wasVerticallyAligned(e) then
      
      if self.x + self.width/2 < e.x + e.width/2 then
        local a = self:checkResolve(e, "right")
        local b = e:checkResolve(self, "left")
        if a and b then
          self:collide(e, "right")
        end
      else 
        local a = self:checkResolve(e, "left")
        local b = e:checkResolve(self, "right")
        if a and b then
          self:collide(e, "left")
        end
      end
      
    elseif self:wasHorizontallyAligned(e) then
      
      if self.y + self.height/2 < e.y + e.height/2 then 
        local a = self:checkResolve(e, "bottom")
        local b = e:checkResolve(self, "top")
        if a and b then
          self:collide(e, "bottom")
        end
      else 
        local a = self:checkResolve(e, "top")
        local b = e:checkResolve(self, "bottom")
        if a and b then
          self:collide(e, "top")
        end
      end
      
  end
        -- There was collision! After we've resolved the collision return true
        ---- ADD THIS
  return true
        -------------
  end
end

function Entity:checkResolve(e, d)
  return true
end

function Entity:collide(e, d)
  if d == "right" then
    local pushback = self.x + self.width - e.x
    self.x = self.x - pushback
  elseif d == "left" then
    local pushback = e.x + e.width - self.x
    self.x = self.x + pushback
  elseif d == "bottom" then
    local pushback = self.y + self.height - e.y
    self.y = self.y - pushback
    self.gravity = 0
    self.canJump = true
  elseif d == "top" then
    local pushback = e.y + e.height - self.y
    self.y = self.y + pushback
  end
end