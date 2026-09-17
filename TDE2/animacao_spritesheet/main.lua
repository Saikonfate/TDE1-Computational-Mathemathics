--[[
  Obs: este exemplo espera um arquivo "spritesheet.png" na mesma
  pasta, com frames organizados em grid
  Ajuste FRAME_LARGURA / FRAME_ALTURA / TOTAL_FRAMES conforme sua imagem.
--]]

local FRAME_LARGURA = 416
local FRAME_ALTURA = 454
local FRAMES_POR_LINHA = 4 
local TOTAL_FRAMES = 20
local TEMPO_POR_FRAME = 0.05

function love.load()
    love.window.setTitle("Animacao de Sprites")

    local ok, imagem = pcall(love.graphics.newImage, "spritesheet.png")
    spritesheet = ok and imagem or nil

    if not ok then
        print("Erro ao carregar imagem:", imagem)
    end

    quads = {}
    if spritesheet then
        local imgLargura = spritesheet:getWidth()
        local imgAltura = spritesheet:getHeight()

        for i = 0, TOTAL_FRAMES - 1 do
            local coluna = i % FRAMES_POR_LINHA
            local linha  = math.floor(i / FRAMES_POR_LINHA)

            quads[i + 1] = love.graphics.newQuad(
                coluna * FRAME_LARGURA,
                linha * FRAME_ALTURA,
                FRAME_LARGURA, FRAME_ALTURA,
                imgLargura, imgAltura
            )
        end
    end

    frameAtual = 1
    tempoAcumulado = 0
end

function love.update(dt)
    tempoAcumulado = tempoAcumulado + dt

    if tempoAcumulado >= TEMPO_POR_FRAME then
        tempoAcumulado = tempoAcumulado - TEMPO_POR_FRAME
        frameAtual = frameAtual + 1
        if frameAtual > TOTAL_FRAMES then
            frameAtual = 1
        end
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)

    if spritesheet then
        love.graphics.draw(spritesheet, quads[frameAtual], 300, 100, 0, 0.3, 0.3)
        love.graphics.print("Frame atual: " .. frameAtual .. "/" .. TOTAL_FRAMES, 10, 10)
    else
        love.graphics.print("(nao foi possivel carregar 'spritesheet.png' - veja o console)", 50, 280)
    end
end