c_wait_soundlength = function(argument0) //gml_Script_c_wait_soundlength
{
    c_wait(round((audio_sound_length(argument0) * room_speed)))
    return;
}

