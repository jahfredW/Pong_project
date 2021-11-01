pad = {}
pad.x = 0
pad.y = 0
pad.largeur = 20
pad.hauteur = 80

balle = {}
balle.x = 400
balle.y = 300
balle.largeur = 20
balle.hauteur = 20
balle.vitesse_x = 2
balle.vitesse_y = 2
balle.vitesseNeg_x = -2
balle.vitesseNeg_x = - 2


function love.load()
  balle.x = love.graphics.getWidth() / 2
  balle.x = balle.x - balle.largeur / 2
  
  balle.y = love.graphics.getHeight() / 2
  balle.y = balle.y  - balle.hauteur / 2

end

function love.update()


if love.keyboard.isDown("down") and 
pad.y < love.graphics.getHeight() - pad.hauteur then
  pad.y = pad.y + 2
end


if love.keyboard.isDown("up") and pad.y > 0 then
  pad.y = pad.y - 2
end

balle.x = balle.x + balle.vitesse_x
balle.y = balle.y + balle.vitesse_y

if balle.x < 0 then
  balle.vitesse_x = balle.vitesse_x * -1
  -- ou : balle.vitesse_x = -balle.vitesse_x
end
if balle.y < 0 then
  balle.vitesse_y = balle.vitesse_y * -1
end
if balle.x > love.graphics.getWidth() - balle.largeur then
  balle.vitesse_x = balle.vitesse_x * -1
end
if balle.y > love.graphics.getHeight() - balle.hauteur then
  balle.vitesse_y = balle.vitesse_y * -1
end
  
if balle.x < pad.largeur and balle.y >= pad.y and balle.y <= pad.y + pad.hauteur then
  balle.vitesse_x = balle.vitesse_x * -1
  balle.vitesse_y = balle.vitesse_y * 1
end  

end


function love.draw()
 

love.graphics.rectangle("fill", pad.x, pad.y, pad.largeur, pad.hauteur)
love.graphics.rectangle("fill", balle.x, balle.y, balle.largeur, balle.hauteur)


end

