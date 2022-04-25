textImage = 0
pressed = false
pressedBuffer = 0
init = false
image_speed = 0
depth = (900000 - y)
pressable = true
bouncecon = 0
bouncetimer = 0
drawY = 0
won = 0
if (room == room_dw_cyber_keyboard_puzzle_1 && global.flag[390] == 1)
    won = 1
if (room == room_dw_cyber_keyboard_puzzle_2 && global.flag[333] == 1)
    won = 1
if (room == room_dw_cyber_keyboard_puzzle_3 && global.flag[420] == 1)
    won = 1
if (won == 1)
{
    pressed = true
    pressable = false
}
