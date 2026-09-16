function love.load()
    love.window.setTitle("Meu Primeiro Jogo - Love2D")
    love.window.setMode(800, 600) -- largura, altura

    mensagem = "Hello, Love2D!"
end

function love.update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0.1, 0.1, 0.15) -- RGB de 0 a 1
    love.graphics.setColor(1, 1, 1) -- branco
    love.graphics.print(mensagem, 350, 280)
    love.graphics.print("Estrutura básica: load -> update -> draw", 200, 320)
end
