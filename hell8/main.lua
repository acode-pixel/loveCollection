
function love.load()
  require 'libs/require'
  class = require 'libs/middleclass'
  local moonshine = require "libs/moonshine"
  require "SceneManager"
  require "Audio"
  
  SceneManager = SceneManager:new()
  AudioController = AudioController:new()
  
  effect = moonshine(moonshine.effects.crt)
  vignette = effect.chain(moonshine.effects.vignette)
  glow = vignette.chain(moonshine.effects.glow)
  glow.glow.min_luma = 0
  glow.glow.strength = 10
  
end

function love.update(dt)
  SceneManager:update(dt)
end

function love.draw()
  glow(function()
    SceneManager:draw()
    end
  )
end

function love.keypressed(key)
  input.press(key)
end

function love.keyreleased(key)
  input.release(key)
end

function love.mousepressed()
  input.mousepress()
end

function love.mousereleased()
  input.mouserelease()
end

function love.focus(f)
  input.toggleFocus(f)
end