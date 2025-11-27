function scr_board_blcon(arg0, arg1, arg2)
{
    with (obj_board_marker)
    {
        if (sprite_index == arg2)
            instance_destroy();
    }
    var nolift = instance_create(arg0, arg1, obj_board_marker);
    nolift.sprite_index = arg2;
    nolift.image_speed = 0.2;
    nolift.image_index = 1;
    nolift.vspeed = -2.8;
    nolift.gravity = 0.2;
    nolift.depth = depth - 100;
    if (nolift.y <= 64)
        nolift.y = 64;
    scr_darksize(nolift);
    scr_doom(nolift, 20);
    with (nolift)
        scr_delay_var("gravity", 0, 15);
    with (nolift)
        scr_delay_var("vspeed", 0, 15);
    snd_stop(snd_error);
    snd_play(snd_error);
}
