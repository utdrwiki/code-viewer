mus_fade = function(argument0, argument1) //gml_Script_mus_fade
{
    audio_sound_gain(argument0, 0, ((argument1 * 1000) / fps))
    return;
}

