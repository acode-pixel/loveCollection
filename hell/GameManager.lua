function Game_Load()
  Object = require "classic"
  tick = require "tick"
  require "Shape"
  require "rectangle"
  require "Bullet"
  require "Player"
  require "Enemy"

  
  player = Player(0, 0, "fill")
  enemy = Enemy(0, 500, "fill")
  Game_Over = false
  score = 0
end

function GameOver() 
  player, enemy = nil, nil
end

function Game_update(dt)
  if Game_Over then
    GameOver()
    return
  end
  player:Movement_update()
  player:update(dt)
  
  if player.bullets then
    for i=#player.bullets,1,-1 do
      if player.bullets[i].visible then
        player.bullets[i]:update(dt)
        player.bullets[i]:Dissappear(enemy)
      else 
        table.remove(player.bullets, i)
      end
    end
  end
  
  enemy:Movement_update()
  enemy:update(dt)
  
  score = enemy.hit_counter
end

function Game_draw()
  player:draw()
  love.graphics.print(score, 400, 300, 0, 5, 5)
  enemy:draw()
  if player.bullets then
    for i,v in ipairs(player.bullets) do
      v:draw()
    end
  end
end