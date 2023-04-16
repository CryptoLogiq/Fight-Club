local player = {}
player.x = 0
player.y = 0
player.speed = 100
player.animation = nil
player.timer = Core.timer.new()
player.sequence = {}
player.sequence.idle = {4, 5}
player.sequence.current = "idle"
player.sequence.currentFrame = 1

function player.move(dt)
  if love.keyboard.isDown("d") then
    player.x = player.x + player.speed*dt
  end
  if love.keyboard.isDown("q") then
    player.x = player.x - player.speed*dt
  end
end
--

function player.updateFrame(dt)
  if player.timer.update(dt) then
    
    player.sequence.currentFrame = player.sequence.currentFrame + 1
    if player.sequence.currentFrame > #player.sequence[player.sequence.current] then
      player.sequence.currentFrame = 1
    end
    --
    print(player.sequence[player.sequence.current][player.sequence.currentFrame])
    player.animation = Game.images[ player.sequence[player.sequence.current][player.sequence.currentFrame] ]
  end
end
--

function player.load()
  player.animation = Game.images[4]
  player.y = love.graphics.getHeight() - player.animation.h
end
--

function player.update(dt)
  player.move(dt)
  player.updateFrame(dt)
end
--

function player.draw()
  player.animation.draw(player.x, player.y)
end
--

return player