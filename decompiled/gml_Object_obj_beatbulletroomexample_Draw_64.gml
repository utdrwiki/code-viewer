if scr_debug()
{
    draw_set_color(c_white)
    draw_text(10, 10, instance_number(obj_beatbullet))
    if snd_is_playing(global.currentsong[1])
    {
        var _beats = (audio_sound_get_track_position(global.currentsong[1]) / spb)
        draw_text(10, 40, _beats)
    }
}
