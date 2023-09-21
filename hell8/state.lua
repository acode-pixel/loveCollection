local state = {}

state.left = false
state.right = false
state.mouse = false
state.space = false
state.gameOver = false
state.gameStart = false
state.lives = 5
state.fastestTime = nil
state.currentScore = nil
state.pallete = {
  {1.0, 0.0, 0.0, 1.0},  -- red
  {0.0, 1.0, 0.0, 1.0},  -- green
  {0.4, 0.4, 1.0, 1.0},  -- blue
  {0.9, 1.0, 0.2, 1.0},  -- yellow
  {1.0, 1.0, 1.0, 1.0}   -- white
}
state.stageCleared = false
state.paused = false

function state:reset()
  self.left = false
  self.right = false
  self.mouse = false
  self.space = false
  self.gameOver = false
  self.lives = 5
  self.stageCleared = false
  self.paused = false
end

return state