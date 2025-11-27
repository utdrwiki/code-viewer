if (!init)
    exit;
if (buffer < 3)
    buffer++;
var in_zone = point_in_rectangle(obj_mainchara.x + 14, obj_mainchara.y, x - 20 - 14, y + 180, x + 166 + 14, y + 340);
if (!in_zone)
{
    if (symbol.in_range())
    {
        symbol.exit_range();
        _speaker_timer = beat_start;
        scr_lerpvar_instance(id, "_speaker_x_scale", _speaker_x_scale, 2, 12, 2, "out");
        scr_lerpvar_instance(id, "_speaker_y_scale", _speaker_y_scale, 2, 12, 2, "out");
        mus_volume(global.currentsong[1], 1, 12);
    }
    exit;
}
else if (!symbol.in_range())
{
    symbol.enter_range();
    if (buffer <= 2)
    {
        mus_volume(global.currentsong[1], 0, 0);
        debug_print("funny spawn.");
    }
    else
    {
        mus_volume(global.currentsong[1], 0, 12);
    }
}
var _bpm_time = (60 / bpm) * 30;
if (_bpm_time < 8)
    _bpm_time *= 2;
debug_print_persistent(id, "BPM:" + string(bpm) + " (" + string(_bpm_time) + " frames per beat)");
_speaker_timer++;
if (_speaker_timer >= 1 && speaker_con == 0)
{
    speaker_con = 1;
    _speaker_anim = 0;
    scr_lerpvar_instance(id, "_speaker_x_scale", 2.2, 2, 12, 2, "out");
    scr_lerpvar_instance(id, "_speaker_y_scale", 2.2, 2, 12, 2, "out");
}
if (_speaker_timer >= (_bpm_time / 4) && speaker_con == 1)
{
    speaker_con = 2;
    _speaker_anim = 1;
}
if (_speaker_timer >= _bpm_time)
{
    speaker_con = 0;
    _speaker_timer -= _bpm_time;
}
var center_point = (x - 20) + 90;
var player_pos = abs((obj_mainchara.x + 14) - center_point);
var _max_vol = remap(100, 0, 0, 1, player_pos);
_max_vol = clamp01(_max_vol);
snd_volume(audio_file, _max_vol, 0);
spawn = false;
