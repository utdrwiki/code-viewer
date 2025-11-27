var candles_readable = instance_create(370, 124, obj_readable_room1);
with (candles_readable)
{
    extflag = "candles";
    image_xscale = 2;
    image_yscale = 0.2;
}
var extinguisher_readable = instance_create(500, 80, obj_readable_room1);
with (extinguisher_readable)
{
    extflag = "extinguisher";
    image_xscale = 0.8;
    image_yscale = 2;
}
var holy_readable = instance_create(250, 100, obj_readable_room1);
with (holy_readable)
    extflag = "holy_water";
var bookshelf_readable = instance_create(100, 100, obj_readable_room1);
with (bookshelf_readable)
{
    extflag = "bookshelf";
    image_xscale = 2;
}
candle_marker = scr_marker(364, 96, bg_church_entrance_items_candles);
with (candle_marker)
    scr_depth();
if (global.plot >= 200)
{
    if (global.plot >= 210 && global.plot < 240)
    {
        if (!snd_is_playing(global.currentsong[1]))
        {
            global.currentsong[0] = snd_init("church_lw_night.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
        }
    }
    with (candle_marker)
        instance_destroy();
    candle_marker = instance_create(364, 96, obj_marker_palette);
    candle_marker.sprite_index = bg_church_entrance_items_candles;
    with (candle_marker)
        depth = 1000100;
    bg_vfx = instance_create(0, 0, obj_church_night_vfx);
    bg_vfx.depth = 1000190;
    var exit_cover = scr_marker(280, 180, spr_pixel_white);
    with (exit_cover)
    {
        image_blend = c_black;
        depth = 1000100;
        image_xscale = 20;
        image_yscale = 20;
    }
    var exit_block = instance_create(exit_cover.x, exit_cover.y, obj_solidblockLight);
    with (exit_block)
        image_xscale = 4;
    if (global.plot >= 290)
    {
        with (exit_cover)
            instance_destroy();
        with (exit_block)
            instance_destroy();
        if (global.plot < 300)
        {
            with (obj_caterpillarchara)
                visible = 0;
        }
    }
    else
    {
        if (scr_flag_get(794) == 0)
            scr_flag_set(794, 1);
        if (global.plot >= 210)
        {
            if (array_length(global.currentsong) <= 2 || !snd_is_playing(global.currentsong[3]))
            {
                global.currentsong[2] = snd_init("raining_in_church2.ogg");
                global.currentsong[3] = mus_loop(global.currentsong[2]);
                mus_volume(global.currentsong[3], 0, 0);
                mus_volume(global.currentsong[3], 0.75, 30);
            }
        }
    }
    pal_swap_layer_init();
    pal_swap_enable_layer("ASSETS_Items");
    pal_swap_set_layer(3934, 2, "ASSETS_Items", false);
    pal_swap_reset();
}
con = -1;
customcon = 0;

answer_choice = function(arg0)
{
    if (scr_flag_get(1509) == 0)
    {
        scr_flag_set(1509, arg0 + 1);
        con = (arg0 == 0) ? 10 : 20;
    }
    else if (scr_flag_get(1507) == 0)
    {
        scr_flag_set(1507, arg0 + 1);
        if (arg0 == 0)
        {
            con = 30;
        }
        else if (arg0 == 1)
        {
            if (!scr_sideb_active())
                con = 40;
            else
                con = 50;
        }
        else if (arg0 == 2)
        {
            con = 60;
        }
    }
};

show_prayer_prompt = function()
{
    con = 25;
};
