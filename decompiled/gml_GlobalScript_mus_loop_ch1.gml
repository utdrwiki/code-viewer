mus_loop_ch1 = function(argument0) //gml_Script_mus_loop_ch1
{
    _xsndinstance = audio_play_sound(argument0, 90, true)
    snd_volume_ch1(_xsndinstance, (1 * global.flag[16]), 0)
    return _xsndinstance;
}

