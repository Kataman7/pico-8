Skull = Entity:new()

function Skull:new(x,y)
    local speed = rnd(0.005)+0.13
    local detection = rnd(10)+100
    local securite = rnd(5)+50
    local obj = Entity.new(self, x, y, 8, 8, speed, 0.2, 0.85, 28)
    obj.jump_f = 2
    obj.jump_c = 0
    obj.anim_frame = 0
    obj.anim_speed = 10
    obj.distance_detect = detection
    obj.speed_attack = 180 - player.stage
    obj.life = 15 + player.stage * 2
    obj.attack = 1 + player.stage
    obj.distance_securite = securite
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Skull:control()
    if self:get_distance_to(player)<self.distance_detect and self:get_distance_to(player)>self.distance_securite then
        if self.x<player.x-1 then
            self.velx = self.velx + self.speed
        elseif self.x>player.x+1 then
            self.velx = self.velx - self.speed
        else
            if self.jump_c < 1 then
                self.vely = -self.jump_f
                self.jump_c = self.jump_c + 1
            end
        end
    end
    if self:get_distance_to(player)<self.distance_securite+1 then
        if self.x<player.x-1 then
            self.velx = self.velx - self.speed
        elseif self.x>player.x+1 then
            self.velx = self.velx + self.speed
        else
            if self.jump_c < 1 then
                self.vely = -self.jump_f
                self.jump_c = self.jump_c + 1
            end
        end
    end
end


function Skull:update()
    self:control()

    --Copie de entity pour pouvoir sauter au bon moment
    self.vely = self.vely + self.gravity
    local new_y = self.y + self.vely

    if not self:check_collision(self.x, new_y) then
        self.y = new_y
    else
        self.vely = 0
    end

    self.velx = self.velx * self.frict
    local new_x = self.x + self.velx
    
    if (abs(self.velx) < 0.1) then
        self.velx = 0
    end

    if self.x ~= new_x then
        if not self:check_collision(new_x, self.y) then
            self.x = new_x
        else
            if self.velx > 50 then
                self.velx = self.velx * -0.5
            elseif self:get_distance_to(player)<self.distance_detect then
                if self.jump_c < 1 then
                    self.vely = -self.jump_f
                    self.jump_c = self.jump_c + 1
                end
            else
                self.velx = 0
            end
        end
    end

    --Réinitialisation du saut
    if self.vely == 0 then
        self.jump_c = 0
    end

    -- Mort si sortie du jeu
    if self.y>300 or self.y<-100 then
        self.life=0
    end

    -- Mort
    if self.life==0 then
        self.sprite=0
        return
    end


    -- Reduction du compteur entre deux attaques
    if self.speed_attack>0 then
        self.speed_attack=self.speed_attack-1
    end

    -- Animation
    if self.velx ~= 0 and self.vely == 0 then
        self.anim_frame += 1
        if self.anim_frame >= self.anim_speed then
            self.anim_frame = 0
            if self.sprite == 29 then
                self.sprite = 30
            else
                self.sprite = 29
            end
        end    
        effects:walk(self.x + self.w / 2, self.y + self.h)
    else
        if self.vely==0 and self.velx==0 then
            self.sprite = 28
        end
    end

    -- Attaque
    if self:get_distance_to(player)<self.distance_detect then
        if self.speed_attack<=0 then
            add(tirs,Tir:new(self.x,self.y))
            self.speed_attack=180 - player.stage
        end
    end

    --Mort!
    if (self.life<=0) then
        self.sprite = 0
    end
end