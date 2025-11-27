con = -1;
customcon = 0;
if (global.plot == 105)
{
    con = 0;
    global.interact = 1;
    global.hp[1] = global.maxhp[1];
    scr_setparty(1, 0, 0);
    with (obj_mainchara)
    {
        cutscene = 1;
        fun = 1;
        sprite_index = dsprite;
        x = 388;
        y = 216;
    }
    with (obj_caterpillarchara)
    {
        cutscene = 1;
        fun = 1;
        sprite_index = dsprite;
        x = 210;
        y = 200;
    }
    blackall = -4;
    if (scr_flag_get(1628) == 1)
    {
        con = 10;
        blackall = scr_dark_marker(-10, -10, spr_pixel_white);
        blackall.image_xscale = 999;
        blackall.image_yscale = 999;
        blackall.depth = 100;
        blackall.image_blend = c_black;
        blackall.image_alpha = 1;
        blackall.visible = 1;
        with (obj_caterpillarchara)
            visible = 0;
    }
    run_check = false;
    run_timer = 0;
    run_con = -1;
}
else
{
    var save_point = instance_create(300, 200, obj_savepoint);
    with (save_point)
        scr_depth();
    instance_destroy();
    exit;
}
