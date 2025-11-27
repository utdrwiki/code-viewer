puzzle_ready = false;
stop_follow = false;
susie_solve = false;
ralsei_solve = false;
susie_press = false;
susie_press_timer = 0;
ralsei_press = false;
ralsei_press_timer = 0;
kris_press = false;
kris_press_timer = 0;
eyemarker[0] = scr_dark_marker(1222, 2712, spr_dw_couch_darkeye);
eyemarker[1] = scr_dark_marker(1362, 2690, spr_dw_couch_darkeye);
eyemarker[2] = scr_dark_marker(1504, 2714, spr_dw_couch_darkeye);
set_puzzle = false;
susie_block = instance_create(1244, 2820, obj_solidblocksized);
ralsei_block = instance_create(1524, 2820, obj_solidblocksized);
ralsei_readable = instance_create(ralsei_block.x, ralsei_block.y + 20, obj_readable_room1);
with (ralsei_readable)
{
    extflag = "ralsei";
    image_xscale = 2;
}
susie_readable = instance_create(susie_block.x, susie_block.y + 20, obj_readable_room1);
with (susie_readable)
{
    extflag = "susie";
    image_xscale = 2;
}

clean_up = function()
{
    with (ralsei_block)
        instance_destroy();
    with (susie_block)
        instance_destroy();
    with (ralsei_readable)
        instance_destroy();
    with (susie_readable)
        instance_destroy();
};

for (var i = 0; i < array_length(eyemarker); i++)
{
    var hole_marker = scr_dark_marker(1242 + (140 * i), 2798, spr_dw_switch_hole);
    with (hole_marker)
        depth = 81000;
    eyemarker[i].image_index = 1;
    with (eyemarker[i])
        scr_depth();
    if (global.plot < 21)
    {
        eyemarker[i].image_index = 0;
        eyesparkle[i] = scr_marker(1252 + (140 * i), 2814, spr_shine);
        with (eyesparkle[i])
        {
            image_xscale = 2;
            image_yscale = 2;
            image_speed = 0.1;
            scr_depth();
        }
    }
}
if (global.plot < 21)
{
    if (variable_global_exists("pause_follow"))
    {
        if (global.pause_follow)
        {
            if (!scr_havechar(2))
                scr_getchar(2);
            if (!scr_havechar(3))
                scr_getchar(3);
            puzzle_ready = true;
            susie_solve = true;
            susie_press = true;
            ralsei_solve = true;
            ralsei_press = true;
            set_puzzle = true;
        }
    }
    layer_set_visible("ASSETS_Magical_Glass", false);
    bridge_collider = instance_create(1640, 2840, obj_soliddark);
    with (bridge_collider)
        image_yscale = 2;
}
else
{
    clean_up();
    instance_destroy();
    exit;
}
