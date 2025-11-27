if (con == 0)
{
    if (do_switch)
    {
        for (var i = 0; i < array_length(track); i++)
            safe_delete(track[i]);
        snd_play_pitch(snd_wing, 1.8);
        if (track_angle_target == image_angle)
            track_angle_target = image_angle + 90;
        else
            track_angle_target = image_angle;
        timer = 0;
        con = 1;
    }
}
if (con == 1)
{
    timer++;
    track_angle = lerp(track_angle, track_angle_target, timer / transitiontime);
    if (timer == transitiontime)
    {
        con = 2;
        timer = 0;
        snd_play_pitch(snd_wing, 1.2);
    }
}
if (con == 2)
{
    track_angle %= 360;
    track_angle_target = track_angle;
    for (var i = 0; i < 3; i++)
    {
        var _tx = (center_x + lengthdir_x((i - 1) * 10, track_angle)) - 5;
        var _ty = (center_y + lengthdir_y((i - 1) * 10, track_angle)) - 5;
        if ((track_angle % 180) == 0)
            track[i] = instance_create_depth(_tx, _ty, depth - 1, obj_traintrack_straight_horizontal);
        else
            track[i] = instance_create_depth(_tx, _ty, depth - 1, obj_traintrack_straight_vertical);
        track[i].visible = false;
    }
    con = 0;
}
