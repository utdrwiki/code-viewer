image_xscale = 4;
image_yscale = 4;
image_index = 1;
image_speed = 0;
pippins_mode = 0;
pippins_sprite = -4;
pippins_anim = 0;
pippins_anim_speed = 0.2;
cover_marker = -4;
pippins_x = x;
pippins_y = y;
hold_coin = false;
is_inside = true;
is_init = false;
is_running = false;
timer = 0;
jump_time = 20;
jump_timer = irandom(5);
treasure_marker = scr_marker(x, y, sprite_index);
treasure_marker.image_xscale = image_xscale;
treasure_marker.image_yscale = image_yscale;
treasure_marker.image_index = 1;
var _block = instance_create(treasure_marker.x, treasure_marker.y + 30, obj_solidblocksized);
with (_block)
{
    image_xscale = 2;
    image_yscale = 1;
}
readable = -4;

init = function(arg0)
{
    pippins_mode = arg0;
    pippins_x = x;
    pippins_y = y;
    pippins_sprite = 1501;
    switch (pippins_mode)
    {
        case 0:
            pippins_sprite = 4970;
            is_inside = false;
            break;
        case 1:
            pippins_sprite = 2210;
            break;
        default:
            pippins_sprite = 1501;
            break;
    }
    scr_depth();
    treasure_marker.depth = depth + 10;
    readable = instance_create(x + 20, y + 20, obj_readable_room1);
    with (readable)
    {
        image_xscale = 2;
        image_yscale = 2;
        extflag = "pippins_rummage";
    }
    is_init = true;
};

set_depth = function(arg0)
{
    depth = arg0;
    treasure_marker.depth = depth + 10;
};

pause = function()
{
    pippins_anim_speed = 0;
    scr_emote("!", 30);
};

look_out = function()
{
    with (readable)
        instance_destroy();
    if (is_inside)
    {
        scr_lerpvar("pippins_y", pippins_y, pippins_y + 60, 8);
        scr_var_delay("pippins_sprite", 1175, 9);
        scr_script_delayed(scr_lerpvar, 9, "pippins_y", pippins_y + 60, pippins_y, 8);
        scr_var_delay("is_inside", false, 14);
        scr_var_delay("hold_coin", true, 15);
        scr_var_delay("pippins_sprite", 2047, 15);
        scr_var_delay("pippins_anim", 4, 14);
        scr_script_delayed(scr_lerpvar, 14, "pippins_y", pippins_y, pippins_y - 80, 6, 3, "out");
        scr_script_delayed(scr_lerpvar, 20, "pippins_y", pippins_y - 80, pippins_y, 6, 3, "in");
        scr_var_delay("pippins_sprite", 1540, 26);
    }
    else
    {
        scr_var_delay("pippins_sprite", 1540, 26);
        scr_var_delay("hold_coin", true, 26);
    }
    scr_script_delayed(scr_lerpvar, 40, "pippins_x", pippins_x, pippins_x + 1220, 140, 3, "out");
    scr_delay_var("pippins_anim_speed", 0, 40);
    scr_delay_var("is_running", true, 40);
    scr_delay_var("is_running", false, 140);
};

clean_up = function()
{
    with (readable)
        instance_destroy();
    with (treasure_marker)
        scr_depth();
    instance_destroy();
};
