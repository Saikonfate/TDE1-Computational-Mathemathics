function love.load()
    love.window.setTitle("Desenho 2D basico")

    local ok, imagem = pcall(love.graphics.newImage, "personagem.png")
    if ok then
        sprite = imagem
    else
        sprite = nil
    end
end

function love.draw()
    -- 1) Retângulo preenchido
    love.graphics.setColor(1, 0.3, 0.3)
    love.graphics.rectangle("fill", 50, 50, 100, 80)

    -- 2) Retângulo apenas contorno
    love.graphics.setColor(0.3, 1, 0.3)
    love.graphics.rectangle("line", 200, 50, 100, 80)

    -- 3) Círculo preenchido
    love.graphics.setColor(0.3, 0.5, 1)
    love.graphics.circle("fill", 400, 90, 45)

    -- 4) Linha
    love.graphics.setColor(1, 1, 0)
    love.graphics.setLineWidth(4)
    love.graphics.line(500, 50, 620, 130)

    -- 5) IMAGEM
   if sprite then
        love.graphics.setColor(1, 1, 1, 0.8)
        love.graphics.draw(sprite, 300, 250)
    else
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("(coloque 'personagem.png' na pasta pra ver a imagem aqui)", 150, 280)
    end

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Formas: rectangle, circle, line, draw(imagem)", 150, 400)
end
