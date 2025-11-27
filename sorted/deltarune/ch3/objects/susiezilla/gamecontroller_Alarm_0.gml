with (obj_susiezilla_house_single)
    event_user(0);
if (perfect_popularity)
{
    snd_play(snd_applause);
    snd_play(snd_crowd_ooh);
    instance_create_depth(clamp(obj_susiezilla_player.myxcenter, xorig + 160, (xorig + width) - 160), obj_susiezilla_player.y + 30, depth - 900000, obj_susiezilla_perfect_popularity);
    with (obj_susiezilla_singlescreen_hud_score)
        score_change(99);
    perfect_popularity = false;
}
wave_do = true;
