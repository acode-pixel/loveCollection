function love.load()
  circle = {}
  mouse = {}
  circle.x, circle.y = 100, 100
  circle.radius = 25
  circle.speed = 400
end

function getDistance(x1, y1, x2, y2)
  local x_distance = x1 - x2
  local y_distance = y1 - y2
  
  local a = x_distance ^ 2
  local b = y_distance ^ 2
  return math.sqrt(a + b)
end

function rotateRectangle(x, y, a)
  local cord_x = x
  local cord_y = y
  love.graphics.push()
  love.graphics.translate(cord_x, cord_y)
  love.graphics.rotate(a)
  love.graphics.rectangle("line", -25, -25, 50, 50)
  love.graphics.pop()
end

function love.update(dt)
  mouse.x, mouse.y = love.mouse.getPosition()
  angle = math.atan2(mouse.y - circle.y, mouse.x - circle.x)
  
  cos = math.cos(angle)
  sin = math.sin(angle)
  
  distance = getDistance(mouse.x, mouse.y, circle.x, circle.y)
  
  circle.x = circle.x + circle.speed * cos  * (distance/150) * dt
  circle.y = circle.y + circle.speed * sin  * (distance/150) * dt
  
end

function love.draw()

  love.graphics.print("angle: " .. angle, 0, 0)

  rotateRectangle(circle.x, circle.y, angle)
  ---[[
  love.graphics.circle("line", circle.x, circle.y, 25)
  love.graphics.line(circle.x, circle.y, mouse.x, mouse.y)
  love.graphics.line(circle.x, circle.y, mouse.x, circle.y)
  love.graphics.line(mouse.x, mouse.y, mouse.x, circle.y)
  
  love.graphics.circle("line", circle.x, circle.y, distance)
  --]]
end