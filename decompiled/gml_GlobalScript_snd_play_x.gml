snd_play_x = function(argument0, argument1, argument2) //gml_Script_snd_play_x
{
    var _mysnd = audio_play_sound(argument0, 50, false)
    snd_volume(_mysnd, argument1, 0)
    snd_pitch(_mysnd, argument2)
    return _mysnd;
}

