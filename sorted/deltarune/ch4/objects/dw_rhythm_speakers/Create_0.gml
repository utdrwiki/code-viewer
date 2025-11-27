init = false;
audio_file = -4;
audio_volume = 0;
symbol = -4;
_base_x_pos = 0;
_base_y_pos = 0;
_speaker_x_scale = 2;
_speaker_y_scale = 2;
_speaker_anim = 0;
_speaker_anim_speed = 0;
_speaker_timer = 0;
scr_depth();

init = function(arg0)
{
    _base_x_pos = arg0.x;
    _base_y_pos = arg0.y;
};

init_song = function(arg0)
{
    audio_file = audio_play_sound(arg0, 50, 1);
    snd_volume(audio_file, audio_volume, 0);
    snd_pitch(audio_file, 0.5);
    init = true;
};

init_symbol = function(arg0)
{
    symbol = arg0;
};

fade_out = function()
{
    init = false;
    snd_volume(audio_file, 0, 30);
};

clean_up = function()
{
    init = false;
    snd_stop(audio_file);
};

buffer = -1;
procced = false;
speaker_con = 0;
bpm = 140;
beat_start = 0;
