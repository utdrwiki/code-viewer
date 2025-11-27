if (i_ex(obj_board_resetbell))
{
    with (obj_board_resetbell)
    {
        if (reset == true)
        {
            reset = false;
            debug_print("beep");
            with (obj_pushableblock_board)
            {
                scr_lerpvar("x", x, daddy.x, 15, -1, "out");
                scr_lerpvar("y", y, daddy.y, 15, -1, "out");
            }
        }
    }
}
if (solved == 0)
{
    with (obj_board_trigger)
    {
        if (place_meeting(x, y, obj_pushableblock_board))
            other.solved = 1;
    }
}
if (solved == 1)
{
    with (obj_board_resetbell)
    {
        puff = instance_create(x, y, obj_board_smokepuff);
        puff.image_blend = #FFF200;
        instance_destroy();
    }
    snd_play(snd_won);
    solved = 2;
}
