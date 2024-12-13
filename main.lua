function _init()
    player = Player:new()
    dcam = Camera:new()
    transition = Transition:new(60, "Loading...")
end

function _update60()

    player:update()
    dcam:update()

    if (player.y / 8 > 40) then
        player.y = 0
        player.x = 64 * 8
        generate_word()
    end
    
end

function _draw()
    if (transition:active()) then
        transition:draw()
        return
    end

    dcam:draw()
    cls(12)
    player:draw()
    map()            
end