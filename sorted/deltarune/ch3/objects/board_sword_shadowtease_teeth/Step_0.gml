if (con == 0 && active)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (extflag == "mouth")
        {
            if (place_meeting(x, y, obj_mainchara_board))
                trig = true;
        }
    }
    if (trig == true)
    {
        con = 1;
        image_alpha = 1;
        image_speed = 0;
        image_index = 0;
    }
}
if (con == 1)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (extflag == "mouth")
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
    global.flag[1010] = 1;
    snd_play_x(snd_face_hit, 0.25, 0.8);
    scr_board_marker(x, y, spr___laugh, 0.4, depth, 2, 1);
    visible = false;
    con = 3;
}
