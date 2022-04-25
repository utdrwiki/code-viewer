snd_pause_ch1 = function(argument0) //gml_Script_snd_pause_ch1
{
    if global.is_console
        snd_volume(argument0, 0, 0)
    audio_pause_sound(argument0)
    return;
}

