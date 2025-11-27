var closet_readable = instance_create(184, 50, obj_readable_room1);
with (closet_readable)
{
    extflag = "closet";
    image_xscale = 1.6;
}
var wardrobe_readable = instance_create(105, 60, obj_readable_room1);
with (wardrobe_readable)
{
    extflag = "wardrobe";
    image_xscale = 2;
}
var bells_readable = instance_create(64, 70, obj_readable_room1);
with (bells_readable)
{
    extflag = "bells";
    image_xscale = 1.5;
}
var piano_readable = instance_create(60, 130, obj_readable_room1);
with (piano_readable)
{
    extflag = "piano";
    image_yscale = 1.4;
}
lightning_active = false;
if (global.plot < 210)
{
    instance_create(0, 0, obj_church_choir_light);
}
else
{
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
    lightning_active = false;
    lightning_timer = 0;
    palette_index = 2;
    closet_door = instance_create(180, 19, obj_marker_palette);
    closet_door.sprite_index = bg_church_choir_door;
    closet_door.image_speed = 0;
    closet_door.image_index = 0;
    with (closet_door)
        scr_depth();
    bg_vfx = instance_create(0, 0, obj_church_night_vfx);
    bg_vfx.depth = 1000110;
    sk_marker = scr_marker(0, 0, spr_lw_church_choir_susie_kris_lightning);
    with (sk_marker)
    {
        depth = 990;
        visible = 0;
    }
    pal_swap_layer_init();
    pal_swap_enable_layer("ASSETS_Items");
    pal_swap_set_layer(3934, 2, "ASSETS_Items", false);
    pal_swap_reset();
    if (global.plot >= 290 && global.plot < 300)
    {
        with (obj_caterpillarchara)
            visible = 0;
    }
}
con = -1;
customcon = 0;

answer_choice = function(arg0, arg1)
{
    switch (arg0)
    {
        case 1400:
            if (arg1 == 0)
            {
                con = 10;
                scr_flag_set(1510, arg1 + 1);
            }
            break;
        case 1402:
            if (arg1 == 0)
                con = 20;
            break;
        case 1404:
            scr_flag_set(1511, arg1 + 1);
            if (arg1 == 0)
                con = 40;
            else
                con = 50;
            break;
        case 1406:
            scr_flag_set(1512, arg1 + 1);
            if (arg1 == 0)
                con = 60;
            else if (arg1 == 1)
                con = 70;
            else
                con = 80;
            break;
    }
};

inspect_piano = function()
{
    con = 35;
};
