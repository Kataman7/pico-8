Zombie = Entity:new()

function Zombie:new(x,y)
    local vel = rnd(0.03)+0.13
    local detection = rnd(5)+60
    local obj = Entity.new(self, x, y, 8, 8, vel, 0.4, 0.85, 10)
    obj.jump_f = 3
    obj.jump_c = 0
    obj.anim_frame = 0
    obj.anim_speed = 10
    obj.distance_detect = detection
    obj.speed_attack = 60
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Zombie:control()
    if self:get_distance_to(player)<self.distance_detect then
        if self.x<player.x then
            self.velx = self.velx + self.speed
        else
            self.velx = self.velx - self.speed
        end
    end
end


function Zombie:update()
    self:control()

    if self.speed_attack>0 then
        self.speed_attack=self.speed_attack-1
    end

    if self.velx ~= 0 and self.vely == 0 then
        self.anim_frame += 1
        if self.anim_frame >= self.anim_speed then
            self.anim_frame = 0
            if self.sprite == 11 then
                self.sprite = 12
            else
                self.sprite = 11
            end
        end    
        effects:walk(self.x + self.w / 2, self.y + self.h)
    else
        if self.vely==0 then
            self.sprite = 10
        end
    end

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
        else if self.vely <= 0 then
            if self.y>player.y then
                if self.jump_c < 1 then
                    self.vely = -self.jump_f
                    self.jump_c = self.jump_c + 1
                end
            end
        end
        end
    end

    if self:check_entity_collision(player) then
        if self.speed_attack<=0 then
            effects:blood(self.x,self.y)
            self.speed_attack=60
            player.life=player.life-1
        end
    end
    if self.vely == 0 then
        self.jump_c = 0
    end
end