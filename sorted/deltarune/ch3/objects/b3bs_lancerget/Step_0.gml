if (init == 0)
{
    var count = random(99);
    with (obj_board_trigger)
    {
        count++;
        var lan = scr_board_marker(x, y, spr_board_lancer_spin, 0);
        lan.image_index = count;
        with (lan)
            scr_depth_board();
        instance_destroy();
    }
}
