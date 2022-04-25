if pressed
    return;
var checkPress = false
if (i_ex(obj_mainchara) && (!pressed) && global.interact == 0)
{
    if place_meeting(x, y, obj_mainchara)
        checkPress = true
}
if checkPress
{
    if (pressed == false)
    {
        pressed = true
        alarm[0] = 30
    }
}
