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
        alarm[0] = 15
        snd_play(snd_wing)
        var exit_forcefield = instance_create((x - 130), (y - 40), obj_forcefield)
        with (exit_forcefield)
        {
            image_xscale = 2
            image_yscale = 4
            scr_depth()
            canttalk = 1
        }
    }
}
