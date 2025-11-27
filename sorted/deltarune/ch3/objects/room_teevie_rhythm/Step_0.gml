var _gain = 0;
if (drawcrowd)
{
    with (obj_mainchara)
        _gain = clamp(1 - (distance_to_point(room_width / 2, y) / (room_width / 2)), 0.5, 1);
}
audio_emitter_gain(emitter, _gain);
