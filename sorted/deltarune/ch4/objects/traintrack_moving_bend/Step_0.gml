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
    switch (track_angle)
    {
        case 0:
            track[1] = instance_create_depth(center_x - 5, center_y - 5, depth - 1, obj_traintrack_corner_bottomleft);
            break;
        case 90:
            track[1] = instance_create_depth(center_x - 5, center_y - 5, depth - 1, obj_traintrack_corner_bottomright);
            break;
        case 180:
            track[1] = instance_create_depth(center_x - 5, center_y - 5, depth - 1, obj_traintrack_corner_topleft);
            break;
        case 270:
            track[1] = instance_create_depth(center_x - 5, center_y - 5, depth - 1, obj_traintrack_corner_topright);
            break;
    }
    if (track_angle <= 90)
        track[0] = instance_create_depth(center_x - 5, center_y - 15, depth - 1, obj_traintrack_straight_vertical);
    else
        track[0] = instance_create_depth(center_x - 5, center_y + 5, depth - 1, obj_traintrack_straight_vertical);
    if (track_angle == 90 || track_angle == 180)
        track[2] = instance_create_depth(center_x - 15, center_y - 5, depth - 1, obj_traintrack_straight_horizontal);
    else
        track[2] = instance_create_depth(center_x + 5, center_y - 5, depth - 1, obj_traintrack_straight_horizontal);
    for (var i = 0; i < array_length(track); i++)
        track[i].visible = false;
    con = 0;
}
