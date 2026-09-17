--[[
  Controle: use as setas para mover o quadrado azul.
  Quando ele encostar no quadrado vermelho (obstáculo), o movimento
  naquela direção é bloqueado.
--]]

function love.load()
    love.window.setTitle("Colisao AABB")

    jogador = { x = 50, y = 260, largura = 50, altura = 50, velocidade = 250 }
    obstaculo = { x = 400, y = 200, largura = 100, altura = 150 }
end

function checaColisao(a, b)
    return a.x < b.x + b.largura and
           a.x + a.largura > b.x and
           a.y < b.y + b.altura and
           a.y + a.altura > b.y
end

function love.update(dt)
    local novoX, novoY = jogador.x, jogador.y

    if love.keyboard.isDown("right") then novoX = novoX + jogador.velocidade * dt end
    if love.keyboard.isDown("left")  then novoX = novoX - jogador.velocidade * dt end
    if love.keyboard.isDown("down")  then novoY = novoY + jogador.velocidade * dt end
    if love.keyboard.isDown("up")    then novoY = novoY - jogador.velocidade * dt end

    local testeX = { x = novoX, y = jogador.y, largura = jogador.largura, altura = jogador.altura }
    if not checaColisao(testeX, obstaculo) then
        jogador.x = novoX
    end

    local testeY = { x = jogador.x, y = novoY, largura = jogador.largura, altura = jogador.altura }
    if not checaColisao(testeY, obstaculo) then
        jogador.y = novoY
    end
end

function love.draw()
    love.graphics.setColor(0.8, 0.2, 0.2)
    love.graphics.rectangle("fill", obstaculo.x, obstaculo.y, obstaculo.largura, obstaculo.altura)

    love.graphics.setColor(0.2, 0.5, 1)
    love.graphics.rectangle("fill", jogador.x, jogador.y, jogador.largura, jogador.altura)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Setas: mover | Vermelho = obstaculo solido (colisao AABB)", 10, 10)
end
