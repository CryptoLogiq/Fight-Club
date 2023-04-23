local ennemi = {}

player = require("Game/player")

ennemi = {}
ennemi.images = {}
ennemi.x = 0
ennemi.y = 0
ennemi.h = 0
ennemi.w = 0
ennemi.Frame = 0
-- Gère la vitesse d'enchainement des coups
ennemi.CanFight = true
ennemi.Fight = false
ennemi.FightTimer = 0
ennemi.FightSpeed = 0.5

function ennemi.load()
    for i=0,1 do
        ennemi.images[i] = love.graphics.newImage("Game/Ressources/foe_"..tostring(i)..".png")
    end
    ennemi.h = ennemi.images[1]:getHeight()
    ennemi.w = ennemi.images[1]:getWidth()
    ennemi.x = love.graphics.getWidth()  - ennemi.w
    ennemi.y = love.graphics.getHeight() - ennemi.h
end

function ennemi.ia(dt)
  -- On gère l'IA de ennemi
  -- 1) on arrête de frapper si besoin
  if ennemi.Fight == true then
    ennemi.FightTimer = ennemi.FightTimer - dt
    if ennemi.FightTimer <= 0 then
      ennemi.Fight = false
      ennemi.Frame = 0
      -- On relance le timer pour faire une pause
      ennemi.FightTimer = ennemi.FightSpeed
    end
  end
  -- On gère la pause
  if ennemi.CanFight == false and ennemi.FightTimer > 0 then
    ennemi.FightTimer = ennemi.FightTimer - dt
    if ennemi.FightTimer <= 0 then
      ennemi.CanFight = true
    end
  end
  
  -- IA débile

  -- 1) On se rapproche de Ruy pour être à portée de mandale
  if player.x < ennemi.x and ennemi.x - player.x > 40 then
    ennemi.x = ennemi.x - 30*dt
  elseif player.x > ennemi.x and player.x - ennemi.x > 40 then
    ennemi.x = ennemi.x + 30*dt
  end

  -- 2) On balance une mandale si l'écarte entre les 2 est <= 40 !
  if math.abs(ennemi.x - player.x) <= 40 and ennemi.CanFight == true then
    ennemi.CanFight = false
    ennemi.Fight = true
    ennemi.Frame = 1
    ennemi.FightTimer = ennemi.FightSpeed
  end
end

function ennemi.update(dt)
    ennemi.ia(dt)
end

function ennemi.draw()
    local milieu

    -- L'ennemi
    milieu = ennemi.images[1]:getWidth()/2 -- On prend la 1ère image comme référence
    local imageFrame = ennemi.images[ennemi.Frame]
    local scaleXennemi = 2
    if player.x > ennemi.x then
      scaleXennemi = -2
    end
    local imageFrame = ennemi.images[ennemi.Frame]
    love.graphics.draw(imageFrame, ennemi.x, ennemi.y, 0, scaleXFoe, 1, milieu, 0)
end

return ennemi