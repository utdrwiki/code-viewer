mus_loop_ext_ch1 = function(argument0, argument1, argument2) //gml_Script_mus_loop_ext_ch1
{
    snd_volume_ch1(argument0, (argument1 * global.flag[16]), 0)
    snd_pitch_ch1(argument0, argument2)
    return mus_loop_ch1(argument0);
}

