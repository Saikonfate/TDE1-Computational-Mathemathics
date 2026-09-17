--[[
  Use as setas do teclado para mover o quadrado.
  Pressione ESPAÇO para trocar a cor do quadrado (ação pontual).
--]]

function love.load()
    love.window.setTitle("Input - teclado")

    jogador = {
        x = 375,
        y = 275,
        tamanho = 50,
        velocidade = 300
    }

    cores = {
        {1, 0.3, 0.3},
        {0.3, 1, 0.3},
        {0.3, 0.5, 1},
        {1, 1, 0.3}
    }
    corAtual = 1
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        jogador.x = jogador.x + jogador.velocidade * dt
    end
    if love.keyboard.isDown("left") then
        jogador.x = jogador.x - jogador.velocidade * dt
    end
    if love.keyboard.isDown("down") then
        jogador.y = jogador.y + jogador.velocidade * dt
    end
    if love.keyboard.isDown("up") then
        jogador.y = jogador.y - jogador.velocidade * dt
    end
end

function love.keypressed(tecla)
    if tecla == "space" then
        corAtual = (corAtual % #cores) + 1
    end
end

function love.draw()
    local cor = cores[corAtual]
    love.graphics.setColor(cor[1], cor[2], cor[3])
    love.graphics.rectangle("fill", jogador.x, jogador.y, jogador.tamanho, jogador.tamanho)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Setas: mover | ESPACO: trocar cor", 10, 10)
end
