

function love.load()
  require "GameManager"
  Game_Load()
end

function love.keypressed(key)
  if key == "r" then
    Game_Load()
    ptint("Reload")
  end
end

function love.update(dt)
  if not Game_Over then
    Game_update(dt)
  end
  if Game_Over and love.keyboard.isDown("q") then
    Game_Load()
  end
end

function love.draw()
  if Game_Over then
    love.graphics.print("Game Over\nPress q to continue\nScore: " .. score, 200, 0)
    return
  end
  Game_draw()
end
