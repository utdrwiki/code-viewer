mus_play_ch1 = function(argument0) //gml_Script_mus_play_ch1
{
    _xsndinstance = audio_play_sound(argument0, 90, false)
    snd_volume_ch1(_xsndinstance, global.flag[16], 0)
    return _xsndinstance;
}

