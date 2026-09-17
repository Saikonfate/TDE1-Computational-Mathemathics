--[[
Um quadrado se move da esquerda pra direita usando velocidade * dt.
--]]

function love.load()
    love.window.setTitle("Game Loop - dt em ação")

    quadrado = {
        x = 50,
        y = 250,
        largura = 50,
        altura = 50,
        velocidade = 200 -- pixels por segundo
    }
end

function love.update(dt)
    -- Se moveêssemos "quadrado.x = quadrado.x + 5" direto,
    -- a velocidade dependeria do FPS da máquina.
    -- Multiplicando pela velocidade por dt, o movimento é
    -- sempre 200 pixels por segundo, não importa o FPS.
    quadrado.x = quadrado.x + quadrado.velocidade * dt

    if quadrado.x > love.graphics.getWidth() then
        quadrado.x = -quadrado.largura
    end
end

function love.draw()
    love.graphics.setColor(0.3, 0.7, 1)
    love.graphics.rectangle("fill", quadrado.x, quadrado.y, quadrado.largura, quadrado.altura)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("FPS atual: " .. love.timer.getFPS(), 10, 10)
    love.graphics.print("Velocidade fixa: 200px/s (independente do FPS)", 10, 30)
end
