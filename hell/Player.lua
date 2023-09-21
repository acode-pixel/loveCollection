Player = Rectangle:extend()

function Player:new(x, y, mode)
  Player.super.new(self, x, y, 100, 100, mode)
  self.bullets = {}
end

function Player:Movement_update()
  if love.keyboard.isDown("right") and (self.x + 100 < 800) then
    self.speed = 300
    return
  end
  if love.keyboard.isDown("left") and self.x >= 0 then
    self.speed = -300 
    return
  end
  self.speed = 0 
end

function love.keypressed(key)
  if key == "space" then 
    local bullet = Bullet(player.x+40, 100, 600)
    table.insert(player.bullets, bullet)
  end
end