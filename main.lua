pad = {}
pad.x = 0
pad.y = love.graphics.getHeight() / 2 - 40
pad.largeur = 20
pad.hauteur = 80

pad2 = {}
pad2.x = 780
pad2.y = love.graphics.getHeight() / 2 - 40
pad2.largeur = 20
pad2.hauteur = 80 

balle = {}
balle.x = 400
balle.y = 300
balle.largeur = 20
balle.hauteur = 20
balle.vitesse_x = 2
balle.vitesse_y = 2
balle.vitesseNeg_x = -2
balle.vitesseNeg_x = - 2


gameLoop = true

sndMur = love.audio.newSource("mur.wav", "static")
  
  
  function rebond()
    if balle.y < 0 then
      balle.vitesse_y = balle.vitesse_y * -1
    end
    
    if balle.x > love.graphics.getWidth() - balle.largeur then
      balle.vitesse_x = balle.vitesse_x * -1
    end
    
    if balle.y > love.graphics.getHeight() - balle.hauteur then
      balle.vitesse_y = balle.vitesse_y * -1
    end
  end  
  
  
  
  
  
  
  function padTouch()
    -- La balle a-t-elle atteint la raquette ?
    if balle.x <= pad.x + pad.largeur then
      -- Tester maintenant si la balle est sur la raquette ou pas
      if balle.y + balle.hauteur > pad.y and balle.y < pad.y + pad.hauteur    
      then
        balle.vitesse_x = balle.vitesse_x * -1
        balle.x = pad.x + pad.largeur
        love.audio.play(sndMur)
      end
    end
  end  
  
  function padTouch2()
    if balle.x >= pad2.x - balle.largeur then
      -- Tester maintenant si la balle est sur la raquette ou pas
      if balle.y + balle.hauteur > pad2.y and balle.y < pad2.y + pad2.hauteur    
      then
        balle.vitesse_x = balle.vitesse_x * -1
        balle.x = pad2.x - balle.largeur
        love.audio.play(sndMur)
      end
    end  
  end
  
  function controle()
    if love.keyboard.isDown("s") and 
    pad.y < love.graphics.getHeight() - pad.hauteur then
      pad.y = pad.y + 2
    end

    if love.keyboard.isDown("z") and pad.y > 0 then
      pad.y = pad.y - 2
    end
  
    
    if love.keyboard.isDown("down") and 
    pad2.y < love.graphics.getHeight() - pad2.hauteur then
      pad2.y = pad2.y + 2
    end

    if love.keyboard.isDown("up") and pad2.y > 0 then
      pad2.y = pad2.y - 2
    end
  end
  
  
  function perdu()
    if balle.x <= 0 or balle.x >= love.graphics.getWidth() - balle.largeur then
      print("Perdu")
      CentreBalle()
      -- ou : balle.vitesse_x = -balle.vitesse_x
    end
  end
  
  
  function CentreBalle()
    balle.x = love.graphics.getWidth() / 2
    balle.x = balle.x - balle.largeur / 2

    balle.y = love.graphics.getHeight() / 2
    balle.y = balle.y - balle.hauteur / 2
  end


  function love.load()
    CentreBalle()
  end
  
  function love.update()

    controle()
    balle.x = balle.x + balle.vitesse_x
    balle.y = balle.y + balle.vitesse_y
    perdu()
    rebond()
    padTouch() 
    padTouch2()
  end

  function love.draw()
   
  love.graphics.rectangle("fill", pad.x, pad.y, pad.largeur, pad.hauteur)
  love.graphics.rectangle("fill", balle.x, balle.y, balle.largeur, balle.hauteur)
  love.graphics.rectangle("fill", pad2.x, pad2.y, pad2.largeur, pad2.hauteur) 
  end