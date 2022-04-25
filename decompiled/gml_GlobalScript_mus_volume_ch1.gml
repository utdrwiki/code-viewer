mus_volume_ch1 = function(argument0, argument1, argument2) //gml_Script_mus_volume_ch1
{
    audio_sound_gain(argument0, (argument1 * global.flag[16]), ((argument2 * 1000) / fps))
    return;
}

