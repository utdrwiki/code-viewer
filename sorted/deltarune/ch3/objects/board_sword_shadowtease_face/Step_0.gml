if (con == 0 && active)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (extflag == "eyes")
        {
            if (place_meeting(x, y, obj_mainchara_board))
                trig = true;
        }
    }
    if (trig == true)
    {
        con = 1;
        image_alpha = 1;
    }
}
if (con == 1)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (extflag == "eyes")
        {
            if (!place_meeting(x, y, obj_mainchara_board))
                trig = true;
        }
    }
    if (trig == true)
        con = 2;
}
if (con == 2)
{
    timer++;
    if (timer == 1)
    {
        global.flag[1009] = 1;
        image_alpha = 1;
        snd_play_x(snd_face_hit, 0.25, 0.8);
    }
    if (timer == 5)
        image_blend = merge_color(c_white, c_black, 0.85);
    if (timer == 10)
        image_blend = merge_color(c_white, c_black, 0.95);
    if (timer == 15)
        instance_destroy();
}
