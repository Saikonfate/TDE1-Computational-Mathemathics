--[[
  Obs: coloque os arquivos "efeito.wav" e "musica.ogg" na pasta
  (ou troque os nomes/extensões pelos seus arquivos de áudio).
  Formatos suportados: wav, ogg, mp3, etc.

  Controles:
    ESPAÇO -> toca o efeito sonoro
    M      -> liga/desliga a música de fundo
--]]

function love.load()
    love.window.setTitle("Audio - efeitos e musica")

    local okEfeito, efeito = pcall(love.audio.newSource, "efeito.wav", "static")
    somEfeito = okEfeito and efeito or nil

    local okMusica, musica = pcall(love.audio.newSource, "musica.ogg", "stream")
    somMusica = okMusica and musica or nil
    if somMusica then
        somMusica:setLooping(true)
    end

    musicaTocando = false
end

function love.keypressed(tecla)
    if tecla == "space" and somEfeito then
        somEfeito:clone():play()
    end

    if tecla == "m" and somMusica then
        if musicaTocando then
            somMusica:pause()
        else
            somMusica:play()
        end
        musicaTocando = not musicaTocando
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("ESPACO: tocar efeito (static)", 10, 10)
    love.graphics.print("M: play/pause musica de fundo (stream, loop)", 10, 30)

    if not somEfeito then
        love.graphics.print("(arquivo 'efeito.wav' nao encontrado)", 10, 60)
    end
    if not somMusica then
        love.graphics.print("(arquivo 'musica.ogg' nao encontrado)", 10, 80)
    end
end
