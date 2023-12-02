--[[

    Player 1 class 

]]

Player1 = Class{}

function Player1:init()

    -- player 1 settings like name, position, velocity

    self.name = 'Mikey'

    self.width = 200
    self.height = 200

    self.x = (VIRTUAL_WIDTH / 2) + (self.width / 1.5)
    self.y = VIRTUAL_HEIGHT - self.height - 4

    self.dx = 0
    self.dy = 0

    -- ground level and gravity values

    self.ground = VIRTUAL_HEIGHT - self.height - 4
    self.gravity = 20
    
    -- forces values for walking, jumping and fighting

    self.jumpForce = 700
    self.walkSpeed = 100
    self.punchForce = 160
    self.kickStrenght = 60
    self.punchStrenght = 60

    -- distance for collisions

    self.safeDistance = 100
    self.punchDistance = 100
    self.kickDistance = 120

    -- player health and actual state

    self.health = 100
    self.died = false

    self.autoplay = false

    -- fighing states

    self.block = false
    self.kick = false
    self.punch = false
    self.hit = false

    -- timer settings

    self.timer = love.timer.getTime()
    self.timerStarted = false
    self.timerDelay = 0.4
    self.hitTimer = false
    self.timerDelayHit = 0.2
    
    -- win counter and winner boolean

    self.wins = 0
    self.win = false

    -- animations

    self.direction = 'left'
    self.animation = {
        ['idle'] = Animation {
            frames = {1, 2, 3, 2},
            interval = 0.3},
        ['walk'] = Animation {
            frames = {31, 32, 33, 34},
            interval = 0.2},
        ['jump'] = Animation {
            frames = {24},
            interval = 0.2},
        ['fall'] = Animation {
            frames = {25},
            interval = 0.2},
        ['block'] = Animation {
            frames = {15},
            interval = 0.2},
        ['kick'] = Animation {
            frames = {22, 23, 23, 21, 31},
            interval = 0.1},
        ['punch'] = Animation {
            frames = {11, 12, 13, 13, 13, 14, 11},
            interval = 0.1},
        ['dead'] = Animation {
            frames = {4},
            interval = 0.2},
        ['hit'] = Animation {
            frames = {16},
            interval = 0.2}
            
    }

    -- default animation

    self.currentAnimation = self.animation['idle']
end

-- function for player movement, initialy all the movements suposed to be here

function Player1:move(direction)
    if direction == 'jump' then
        self.dy = -self.jumpForce
        self.currentAnimation = self.animation['jump']
    end
end

-- function for keyboard input

function Player1:keypressed(key)
    
    if keysPressed['up'] then
        if self.y == self.ground then
            self:move('jump')
        end
    
    end
end

function Player1:update(dt)

    -- if walking play the footsteps sound

    if self.currentAnimation == self.currentAnimation['walk'] then
        love.audio.play(gSound['sfx1'])
    end

    -- if health drops to 0 kill the player

    if self.health <= 0 and not self.died then
        self.died = true
        game.ended = true
        game.timerStarted = false
        game.winner = player2.name
        player2.win = true
        player2.wins = player2.wins + 1
        player2.currentAnimation = player2.animation['idle']
        self.currentAnimation = self.animation['dead']
        message:changeText(game.winner .. ' wins!')
    end

    -- apply the gravity to the player vertical position

    self.dy = self.dy + self.gravity
    self.y = self.y + (self.dy * dt) 

    -- if on the ground stop

    if self.y >= self.ground then
        self.y = self.ground
        self.dy = 0     
    end

    -- if player alive adn game is running

    if not self.died and game.started then

        -- change animation to idle when not walking and not fighting

        if not love.keyboard.isDown('left') and not love.keyboard.isDown('right') then
            if love.timer.getTime() - self.timerDelay > self.timer then
                self.currentAnimation = self.animation['idle']
                self.dx = 0
                self.timerStarted = false
            end
        end

        -- don't blokc when block keyboard released

        if not love.keyboard.isDown('down') then
            self.block = false
        end

        -- don't punch when key is released and timer completed

        if not love.keyboard.isDown('p') then
            if love.timer.getTime() - self.timerDelay > self.timer then
                self.punch = false
                self.timerStarted = false
            end
        end

        -- don't kick when key is released and timer completed

        if not love.keyboard.isDown(';') then
            if love.timer.getTime() - self.timerDelay > self.timer then
                self.kick = false
                self.timerStarted = false
            end
        end
    
        -- if left key is down 

        if love.keyboard.isDown('left') then

            -- walk when not on the edge of the screen and not far from the other player

            if self.x > -210 and math.abs(distance()) < 400 then
                self.x = self.x - self.walkSpeed * dt
            end

            -- animate character even when on the edge

            if self.dy == 0 then
                self.currentAnimation = self.animation['walk']
            end

            -- play footsteps sound

            gSound['sfx8']:play()

        -- when right button pressed and not far from the other player

        elseif love.keyboard.isDown('right') and math.abs(distance()) < 400 then

            -- move character when not close the edge

            if self.x - (self.width / 4 )< arena.rightSide then
                self.x = self.x + self.walkSpeed * dt
            end

            -- this is cool oldschool effect, I could use the condition to change the animation to idle but I like it like it is
            
            if self.dy == 0 then
                self.currentAnimation = self.animation['walk']
            end

            -- play footsteps sound

            gSound['sfx8']:play()
            

        -- when block button pressed

        elseif love.keyboard.isDown('down') then
            
            -- set animation to block and set block active

            self.currentAnimation = self.animation['block']
            self.block = true

        -- when kick button pressed 

        elseif love.keyboard.isDown(';') then

            -- set animation to kick and set kick active

            self.currentAnimation = self.animation['kick']
            self.kick = true

            -- start the timer if not started 

            if not self.timerStarted then
                self.timer = love.timer.getTime()
                self.timerStarted = true
            end

            -- play the sounds hit and growl

            gSound['sfx5']:play()
            gSound['sfx3']:play()

        -- when punch button pressed 

        elseif love.keyboard.isDown('p') then

            -- set animation to punch and set punch active

            self.currentAnimation = self.animation['punch']
            self.punch = true

            -- start the timer if not started 

            if not self.timerStarted then
                self.timer = love.timer.getTime()
                self.timerStarted = true
            end

            -- play the sounds

            gSound['sfx6']:play()
            gSound['sfx3']:play()

        -- when no button pressed

        else

            -- when in the air

            if self.dy < 0 then
                
                -- if velocity lower than 0 so going up set animation to jump
                
                self.currentAnimation = self.animation['jump']
            elseif self.dy > 0 then

                -- if velocity higher than 0 so going down set animation to fall

                self.currentAnimation = self.animation['fall']

            -- when on the ground

            else

                -- if timer not active change animation to idle

                if not self.timerStarted then
                    self.currentAnimation = self.animation['idle']
                end
            end
        end

        -- if distance between player goes over 400 bring them closer

        if distance() >= 400 then
            self.x = self.x - 5
        elseif distance() <= -400 then
            self.x = self.x + 5
        end

        -- if players to close to each other move them away

        if distance() < 60 and distance() > 0 then
            self.dx = 0
            self.x = self.x + 5
        elseif distance() > - 60 and distance() < 0 then
            self.dx = 0
            self.x = self.x - 5
        end

        -- if kick is active 

        if self.kick then
            
            -- if in range

            if math.floor(distance()) < self.kickDistance then

                -- if other player blocked then less damage 

                if not player2.died and player2.block then
                    player2.health = player2.health - (6 * dt)
                    self.kick = false

                -- if player not blocking more damage 

                elseif not player2.died and not player2.block then 
                    player2.health = player2.health - (math.random(6,self.kickStrenght) * dt)
                    self.kick = false
                end

                -- set other player hit active

                player2.hit = true
            end
        end

        -- if punch is active

        if self.punch then

            -- if in range

            if math.floor(distance()) < self.punchDistance then

                -- if other player blocked then less damage 

                if not player2.died and player2.block then
                    player2.health = player2.health - (5 * dt)
                    self.punch = false

                -- if other player is not blocking then more damage 

                elseif not player2.died and not player2.block then 
                    player2.health = player2.health - (math.random(5,self.punchStrenght) * dt)
                    self.punch = false
                end

                -- set other player hit active

                player2.hit = true
            end
        end

        -- when hit active change the animation and move the player
        if self.hit then
            
            -- set the timer 

            if love.timer.getTime() - self.timerDelayHit > self.timer then
                self.hitTimer = false
            end

            -- move if not on the edge

            if self.x < arena.rightSide and self.x > -210 then
                self.x = self.x + (self.punchForce * dt)
            end

            -- set animation to hit

            self.currentAnimation = self.animation['hit']

            -- when timer elapsed change animation to idle and deactivate hit

            if not self.hitTimer then
                if math.abs(distance()) > self.safeDistance then                
                    self.hit = false
                    self.currentAnimation = self.animation['idle']
                end
            end

            -- play sound

            gSound['sfx2']:play()
            
        end

        -- set the timer if not set

        if self.hit and not self.timerStarted then
            self.timer = love.timer.getTime()
            self.hitTimer = true
            self.timerStarted = true
        end

    -- change the animation when dead

    elseif self.died then
        self.currentAnimation = self.animation['dead']
    end
    
    -- update teh current animation

    self.currentAnimation:update(dt)
    
end

function Player1:render()

    -- render the player

    love.graphics.draw(gImage['mikey-cap'], gFrame['mikey-cap'][self.currentAnimation:getCurrentFrame()], self.x, self.y,0, self.direction == 'right' and 1 or -1, 1, self.width / 2)
end
