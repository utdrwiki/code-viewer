snd_resume_ch1 = function(argument0) //gml_Script_snd_resume_ch1
{
    if global.is_console
        snd_volume(argument0, 1, 0)
    audio_resume_sound(argument0)
    return;
}

