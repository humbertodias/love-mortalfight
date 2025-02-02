--[[

    File with all the required libraries and classes, variables and lists

]]

Class = require 'lib/class'
push = require 'lib/push'

require 'src/constants'

require 'src/Animation'
require 'src/Arena'
require 'src/Collision'
require 'src/Debug'
require 'src/Engine'
require 'src/Game'
require 'src/HealthBar'
require 'src/Message'
require 'src/Player1'
require 'src/Player2'
require 'src/Start'
require 'src/Util'

arena = Arena()
debug = Debug()
message = Message()
engine = Engine()
game = Game()
healthBar = HealthBar()
player1 = Player1()
player2 = Player2()
start = Start()

volume = 0.5

keysPressed = {}

-- fonts downloaded from www.dafont.com
-- Arcade Alternate font is created and owned by Muizz Kasim.
-- 8-bit pusab by Seba Perez
-- PixAntiqua by Gerhard Großmann 

gFont = 
{
    ['alternate'] = love.graphics.newFont('fonts/ArcadeAlternate.ttf'),
    ['8_bit_pusab'] = love.graphics.newFont('fonts/8-bit-pusab.ttf'),
    ['PixAntiqua'] = love.graphics.newFont('fonts/PixAntiqua.ttf')
}

-- images shoot on iPhone 7 and edited in GIMP

gImage = {
    ['mikey-cap'] = love.graphics.newImage('graphics/mikey-cap.png'),
    ['janusz-full'] = love.graphics.newImage('graphics/janusz-full.png'),
    ['arena']= love.graphics.newImage('graphics/arena.png'),
    ['start']= love.graphics.newImage('graphics/start.png')

}

gFrame = {
    ['mikey-cap'] = GenerateQuads(gImage['mikey-cap'], player1.width, player1.height),
    ['janusz-full'] = GenerateQuads(gImage['janusz-full'], player2.width, player2.height),
}

-- music track: alex-productions-epic-cinematic-gaming-cyberpunk-reset(chosic.com).
-- rest of sounds recorded by myself
gSound = {
    ['music'] = love.audio.newSource('sounds/alex-productions-reset.mp3', 'static'),
    ['sfx1'] = love.audio.newSource('sounds/sfx1.mp3', 'static'),
    ['sfx2'] = love.audio.newSource('sounds/sfx2.mp3', 'static'),
    ['sfx3'] = love.audio.newSource('sounds/sfx3.mp3', 'static'),
    ['sfx4'] = love.audio.newSource('sounds/sfx4.mp3', 'static'),
    ['sfx5'] = love.audio.newSource('sounds/sfx5.mp3', 'static'),
    ['sfx6'] = love.audio.newSource('sounds/sfx6.mp3', 'static'),
    ['sfx7'] = love.audio.newSource('sounds/sfx7.mp3', 'static'),
    ['sfx8'] = love.audio.newSource('sounds/sfx8.mp3', 'static')
}