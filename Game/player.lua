local player = {}
player.x = 0
player.y = 0
player.speed = 100
player.animation = nil
player.timer = Core.timer.new(200)
player.sequence = {}
player.sequence.idle = {4}
player.sequence.walk = {4, 5}
player.sequence.punch = {6}
player.sequence.current = "idle"
player.sequence.currentFrame = 1

function player.changeAnimation(pAnim)
  player.sequence.current = pAnim
  player.sequence.currentFrame = 1
  player.animation = Game.images[ player.sequence[player.sequence.current][player.sequence.currentFrame] ]
end

function player.move(dt)
  if love.keyboard.isDown("d") or love.keyboard.isDown("q") then
    if player.sequence.current == "idle" then
      player.sequence.current = "walk"
      player.sequence.currentFrame = 1
    end
    if love.keyboard.isDown("d") then
      player.x = player.x + player.speed*dt
    end
    if love.keyboard.isDown("q") then
      player.x = player.x - player.speed*dt
    end
  else
    if player.sequence.current ~= "idle" then
      player.sequence.current = "idle"
      player.sequence.currentFrame = 1
    end
  end
end

function player.updateFrame(dt)
  if player.timer.update(dt) then
    if player.sequence.current == "idle" or player.sequence.current == "walk" then
      player.sequence.currentFrame = player.sequence.currentFrame + 1
      if player.sequence.currentFrame > #player.sequence[player.sequence.current] then
        player.sequence.currentFrame = 1
      end
      --
      player.animation = Game.images[ player.sequence[player.sequence.current][player.sequence.currentFrame] ]
    else
      player.changeAnimation("idle")
    end
  end
end
--

function player.load()
  player.animation = Game.images[4]
  player.y = love.graphics.getHeight() - player.animation.h
end
--

function player.update(dt)
  --player.move(dt)
  player.updateFrame(dt)
end
--

function player.draw()
  player.animation.draw(player.x, player.y)
end
--
function player.keypressed(k)
  if k == "right" then
    player.changeAnimation("punch")
  end
end

return player