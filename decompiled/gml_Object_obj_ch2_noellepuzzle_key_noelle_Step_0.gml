if (init == false)
{
    if (ord(myString) <= 57)
        textImage = (ord(myString) - 22)
    else
        textImage = (ord(string_upper(myString)) - 65)
    init = true
}
var checkPress = false
if (i_ex(obj_actor) && (!pressed) && pressable && global.interact == 0)
{
    if place_meeting(x, y, obj_actor)
        checkPress = true
}
if checkPress
{
    if (pressed == false)
    {
        pressedBuffer = 2
        pressed = true
        with (obj_ch2_noellepuzzle_screen)
            image_timer = 7
        var _snd = snd_play(asset_get_index(("snd_speak_and_spell_" + myString)))
        var _volume = (buttonIndex == 7 ? 1 : max((1 - (buttonIndex / 4)), 0))
        audio_sound_gain(_snd, _volume, 0)
        alarm[0] = 15
        controller.finalString += myString
        controller.buttonx = x
        down = 1
        if i_ex(obj_ch2_noellepuzzle_screen)
        {
            with (obj_ch2_noellepuzzle_screen)
            {
                if (forcefield_id == other.forcefield_id && myString != other.myString)
                {
                    snd_play(snd_wing)
                    myString = other.myString
                }
            }
        }
    }
}
else if (pressable && global.interact == 0)
{
    if (pressedBuffer <= 0)
        pressed = false
}
