AudioController = class("AudioController")

function AudioController:initialize()
  self.sounds = {}
  local lfs = love.filesystem
  local files = lfs.getDirectoryItems("sounds")
  
  for _,f in ipairs(files) do
    self.sounds[f:match("(.+)%..+$")] = love.audio.newSource("sounds/" .. f, "static")
  end
end

function AudioController:play(sound)
  self.sounds[sound]:play()
end