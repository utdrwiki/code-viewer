scr_debug_soundboard = function() //gml_Script_scr_debug_soundboard
{
    if scr_debug()
    {
        for (var __sndcount = 0; __sndcount < (argument_count + 1); __sndcount++)
        {
            if keyboard_check_pressed(ord(string(__sndcount)))
                snd_play(argument[__sndcount])
        }
    }
    return;
}

