--[[
  Controles:
    ESPAÇO no menu     -> começa o jogo
    Setas durante jogo  -> mover o quadrado
    Encostar na borda   -> game over
    ESPAÇO no game over -> volta ao menu
--]]

-- Estado atual do jogo: "menu", "jogando" ou "gameover"
estado = "menu"

function love.load()
    love.window.setTitle("Estados de Jogo")
    reiniciarJogo()
end

function reiniciarJogo()
    jogador = { x = 375, y = 275, tamanho = 50, velocidade = 250 }
end

function love.update(dt)
    if estado == "jogando" then
        if love.keyboard.isDown("right") then jogador.x = jogador.x + jogador.velocidade * dt end
        if love.keyboard.isDown("left")  then jogador.x = jogador.x - jogador.velocidade * dt end
        if love.keyboard.isDown("up")    then jogador.y = jogador.y - jogador.velocidade * dt end
        if love.keyboard.isDown("down")  then jogador.y = jogador.y + jogador.velocidade * dt end

        local w, h = love.graphics.getDimensions()
        if jogador.x <= 0 or jogador.x + jogador.tamanho >= w or
           jogador.y <= 0 or jogador.y + jogador.tamanho >= h then
            estado = "gameover"
        end
    end
end

function love.keypressed(tecla)
    if tecla == "space" then
        if estado == "menu" then
            estado = "jogando"
        elseif estado == "gameover" then
            reiniciarJogo()
            estado = "menu"
        end
    end
end

function love.draw()
    if estado == "menu" then
        love.graphics.print("MENU PRINCIPAL", 340, 250)
        love.graphics.print("Pressione ESPACO para comecar", 280, 280)

    elseif estado == "jogando" then
        love.graphics.setColor(0.3, 0.7, 1)
        love.graphics.rectangle("fill", jogador.x, jogador.y, jogador.tamanho, jogador.tamanho)
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("Nao encoste nas bordas!", 10, 10)

    elseif estado == "gameover" then
        love.graphics.print("GAME OVER", 360, 250)
        love.graphics.print("Pressione ESPACO para voltar ao menu", 260, 280)
    end
end
