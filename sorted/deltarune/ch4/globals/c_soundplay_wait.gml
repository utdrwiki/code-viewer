function c_soundplay_wait(arg0)
{
    c_cmd("soundplay", arg0, 0, 0, 0);
    c_wait(round(audio_sound_length(arg0) * room_speed));
}

function c_playsound_wait(arg0)
{
    c_soundplay_wait(arg0);
}
