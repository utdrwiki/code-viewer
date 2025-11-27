var pitcher_readable = instance_create(84, 170, obj_readable_room1);
with (pitcher_readable)
    extflag = "pitcher";
var drinks_readable = instance_create(182, 122, obj_readable_room1);
with (drinks_readable)
{
    extflag = "drinks";
    image_yscale = 1.8;
}
var cupboard_readable = instance_create(38, 140, obj_readable_room1);
with (cupboard_readable)
{
    extflag = "cupboard";
    image_yscale = 2;
}
var books_readable = instance_create(40, 80, obj_readable_room1);
with (books_readable)
{
    extflag = "books";
    image_xscale = 2;
    image_yscale = 2;
}
var plaque_readable = instance_create(135, 70, obj_readable_room1);
with (plaque_readable)
{
    extflag = "plaque";
    image_xscale = 1;
    image_yscale = 1;
}
var hanging_readable = instance_create(170, 70, obj_readable_room1);
with (hanging_readable)
{
    extflag = "hanging";
    image_xscale = 1;
    image_yscale = 1;
}
if (global.plot < 210)
{
    instance_create(0, 0, obj_church_office_light);
}
else
{
    lightning_active = false;
    lightning_timer = 0;
    palette_index = 2;
    bg_vfx = instance_create(0, 0, obj_church_night_vfx);
    bg_vfx.depth = 1000290;
    pal_swap_layer_init();
    pal_swap_enable_layer("BG_Items");
    pal_swap_set_layer(3934, palette_index, "BG_Items", false);
    pal_swap_reset();
    if (global.plot >= 290 && global.plot < 300)
    {
        with (obj_caterpillarchara)
            visible = 0;
    }
}

show_lightning = function()
{
    lightning_active = true;
    scr_delay_var("lightning_active", false, 91);
    scr_lerpvar("palette_index", 1, 2, 90, 3, "out");
};
