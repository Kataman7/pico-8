Tnt = Entity:new()

function Tnt:new(x, y, power, range, tick)
    local obj = Entity.new(self, x, y, 8, 8, 0.2, 0.4, 0.85, 64)
    obj.power = power
    obj.range = range
    obj.tick = tick
    obj.anim_frame = 0
    obj.anim_speed = 10
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Tnt:update()
    Entity.update(self)

    self.tick -= 1

    if self.tick <= 1 then
        if self.power > 0 then
            self:propulse(player)
            for monstre in all(monstres) do
                self:propulse(monstre, true)
            end
            self:destroyMap()
            effects:explosion(self.x + self.w / 2, self.y + self.h / 2)
        end

        self.power = 0
        self.sprite = 0
    end

    
    self.anim_frame += 1
    if self.anim_frame >= self.anim_speed then
        self.anim_frame = 0
        if self.sprite == 64 then
            self.sprite = 65
        elseif self.sprite == 64 then
            self.sprite = 65
        elseif self.sprite == 65 then
            self.sprite = 66
            self.anim_speed = self.anim_speed - 1
        elseif self.sprite == 66 then
            self.sprite = 67
        elseif self.sprite == 67 then
            self.sprite = 68
        elseif self.sprite == 68 then
            self.sprite = 69
            self.anim_speed = self.anim_speed - 1
        elseif self.sprite == 69 then
            self.sprite = 70
        elseif self.sprite == 70 then
            self.sprite = 71
        else
            self.sprite = 64
            self.anim_speed = self.anim_speed - 1
        end
    end    
end

function Tnt:propulse(other, damage)
        local dx = other.x - self.x
        local dy = other.y - self.y
        local dist = sqrt(dx * dx + dy * dy)

        if dist < self.range then
            -- Gérer le cas où la distance est nulle
            if dist == 0 then
                -- Direction par défaut vers le haut
                dx = 0
                dy = -1
                dist = 1  -- Évite la division par zéro
            end

            if not other.explosion_resistance then
                local force = self.power * (1 - dist / self.range)
                other.velx = other.velx + (dx / dist) * force
                other.vely = other.vely + (dy / dist) * force
            end

            if damage then
                other.life -= self.power * (1 - dist / self.range) * 2
                effects:blood(other.x, other.y)
            end

        end
end

function Tnt:destroyMap()

    -- Destruction de la map
    local center_mx = flr((self.x + 4) / 8) -- Position centre en tiles
    local center_my = flr((self.y + 4) / 8)
    local radius = flr(self.range / 30) * 1.2 -- Rayon en tiles

    for dx = -radius, radius do
        for dy = -radius, radius do
            -- Vérification cercle avec Pythagore
            if dx*dx + dy*dy <= radius*radius then
                local mx = center_mx + dx
                local my = center_my + dy
                
                if mx >= 0 and mx < 128 and my >= 0 and my < 64 then
                    
                    mineral = mget(mx, my)

                    if fget(mget(mx, my), 2) then
                        player.mineral += player.mineral_mult;
                    end

                    if not fget(mget(mx, my), 1) then 
                        mset(mx, my, 0)
                    end
                end
            end
        end
    end
end