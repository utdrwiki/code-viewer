mus_play = function(argument0) //gml_Script_mus_play
{
    _xsndinstance = audio_play_sound(argument0, 90, false)
    snd_volume(_xsndinstance, global.flag[16], 0)
    return _xsndinstance;
}

