# MORTAL FIGHT
#### Video Demo: https://youtu.be/FVl0e7e_vdg
#### Description: 

Hi, my name is Mike, I am from Southampton in UK and this is my CS50 final project. I decided to create a simple fighting game inspired by my beloved Mortal Kombat. It is a two-player game created in the Lua programming language using the Love2d framework. It's very simple, just beat your opponent before he beats you.
With no time limit, whoever wins two rounds wins the game. Use your keyboard to control the player.

## KEYBOARD CONTROLS

### On the home screen:

#### ENTER – start the game
#### ESC - quit the game

### During the game:

#### ESC - back to the start screen

#### Player 1 – Mikey (right):
#### up - jump
#### down - block
#### left - forward
#### right - back
#### ; - kick

#### Player 2 - Janurz (left):
#### W - jump
#### S - block
#### A - forward
#### D - back
#### R - punch
#### F - kick

I based the script on a lecture by Colton Ogden from CS50 Mario. All photos used in the project were taken with an iPhone and edited in Gimp as I use Linux. To remove the background from photos, I used a free tool at photoscissors.com. Music RESET by Alex-Productions downloaded from https://www.chosic.com/. Fonts downloaded from dafont.com. The Arcade Alternate font was created and owned by Muizz Kasim, the 8-bit pusab font was created by Seba Perez, and finally PixAntiqua by Gerhard Großmann.

## CODE EXPLAINED

Here is a brief description of the files in the project. Please check the code for more information. You can find it on github or on my website http://mikeladkowski.com/MortalFight.html.

### main.lua

This main game file. To function properly, it requires several files with classes, libraries, functions and multimedia.
Contains love2d functions: Load(), update(dt) and Draw(). The Load() function runs only once when the program starts. The update(dt) and Draw() functions will be executed in the loop. It also includes window resizing and keyboard control features.
Sets up the window and loads the dependency.lua file, which contains all the libraries, classes and variables. The music is played at the beginning and is intended to be repeated when it ends.
The update() function will run the update() function in the Engine class
The draw() function will trigger the render() function in the Engine class.

### LIB/

### class.lua, push.lua

Libraries for classes and canvas control.

### SRC/

### dependency.lua

This file will load all libraries, classes and other files. Objects, variables and lists containing fonts, graphics and sounds are created here.

### constant.lua

This file contains constant values used in the game. For now, only screen and window dimensions.

### Animation.lua, Util.lua

Files from the GD50 Super Mario Bros. Remake. Author: Colton Ogden

### Arena.lua

Arena class for displaying and scrolling the background.
Players will always be visible and the screen centered because the distance between them must be less than 400 pixels and is based on the position of player 2 (left).

### Collision.lua

It only contains a distance function to measure the distance between players.

### Degug.lua

A helper class for displaying variables for debugging.

### Engine.lua

A basic state machine that allows you to check the state of the game. If the "main menu" update and object rendering starts, if the status is "game", update and render the game object. In simple words, display the start screen or start a game.

### Game.lua

The mechanism that controls the game, counts rounds and checks which player wins, etc. Updates and renders the arena and both players.

### HealthBar.lua

Displays health bar and wins.

### Message.lua

Displays a message in the center of the dimmed screen.

### Player1.lua, Player2.lua

Player classes to control position, player state, and rendering of the current animation.

All player key inputs are controlled from here. When no button is pressed, the player animation is set to "idle". When punching, kicking, or getting hit, a timer will start to control the length of the animation.

To put it simply, the player only deals damage while within range and each hit pushes the opponent away. A punch and a kick can vary in strength and range. Each player may have different statistics.

When blocking, the player takes less damage. Jumping currently has no impact on the game as the script will only check for horizontal collisions.

### Start.lua

Displays the start screen. Press ENTER to start the game. Press ESC to exit the game. When you finish the game, you will be returned to this screen.

### FONTS/

### 8-bit-pusab.ttf, ArcadeAlternate.ttf, PixAntiqua.ttf

The 8-bit pusab font was created by Seba Perez.
Arcade Alternate font was created and owned by Muizz Kasim.
PixAntiqua by Gerhard Großmann.
Fonts downloaded from dafont.com.

### GRAPHICS/

### arena.png, janusz-full.png, mikey-cap.png, start.png

Artwork created by Mike Ladkowski. Using iPhone, Gimp and photoscissors.com. Thank you to Ola for helping me with the photo session.

### SOUNDS/

### alex-productions-reset.mp3

Epic Cinematic Gaming Cyberpunk | RESET by Alex-Productions | https://onsound.eu/
Music promoted by https://www.chosic.com/free-music/all/
Creative Commons CC BY 3.0
https://creativecommons.org/licenses/by/3.0/

### sfx1.mp3 - sfx8.mp8

Sounds recorded by Mike Ladkowski.