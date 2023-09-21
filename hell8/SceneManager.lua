SceneManager = class("SceneManager")

function SceneManager:initialize()
  state = require "state"
  input = require "input"
  
  require.tree("Scenes")
  currentScene = startScreen:new()
end

function SceneManager:update(dt)
  if currentScene.update then currentScene:update(dt) end
end

function SceneManager:draw()
  currentScene:draw()
end

