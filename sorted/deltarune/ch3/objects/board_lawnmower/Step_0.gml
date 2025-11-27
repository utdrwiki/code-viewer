if (init == 0)
{
    mysolid = instance_create(x, y, obj_board_solid);
    if (scr_debug())
    {
    }
    init = 1;
}
if (active)
{
    if (speed > 0)
    {
        movingtimer++;
        if ((movingtimer % 2) == 0)
        {
            snd_stop(snd_board_torch);
            snd_play_pitch(snd_board_torch, 1 + (speed / 10));
        }
        image_speed = 0.5;
        if (place_meeting(x + hspeed, y + vspeed, obj_board_solidenemy))
        {
            image_speed = 0.1;
            myinteract = 0;
            x = round(x / 32) * 32;
            y = round(y / 32) * 32;
            hspeed = 0;
            vspeed = 0;
            snd_play(snd_board_door_close);
            movingtimer = 0;
        }
    }
}
scr_depth_board();
