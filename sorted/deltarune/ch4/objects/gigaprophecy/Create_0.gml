surf_width = 320;
surf_height = 240;
depth = 2000010;
prophspace_width = 1024;
prophspace_height = 1024;
roomglow = instance_create(0, 0, obj_roomglow);
roomglow.active = true;
roomglow.actind = 1;
roomglow.tiles_only = true;
colour_bluenonsense = 16764994;
sprite_blueswirly = 3124;
sprite_blueswirly_blur = 1522;
surf_frontprophecies = -1;
surf_parallax_close = -1;
surf_parallax_stars = -1;
if (layer_exists("BGCOLOR"))
    layer_background_blend(layer_background_get_id("BGCOLOR"), c_black);
time_seconds = 0;
which_prophecy = ds_list_create();
var i = 0;
repeat (sprite_get_number(spr_dw_church_prophecy_set))
{
    ds_list_add(which_prophecy, i);
    i++;
}
ds_list_shuffle(which_prophecy);

var _get_prophecy = function()
{
    static current = 0;
    
    current++;
    if (current >= ds_list_size(which_prophecy))
    {
        current = 0;
        ds_list_shuffle(which_prophecy);
    }
    return ds_list_find_value(which_prophecy, current);
};

var _gap = 256;
for (var j = 0; j <= (1 + (prophspace_height div _gap)); j++)
{
    for (i = 0; i <= (1 + (prophspace_width div _gap)); i++)
    {
        if ((!(j % 2) && i % 2) || (j % 2 && !(i % 2)))
        {
            instance_create_layer(50 + (i * _gap) + irandom_range(-42, 42), 50 + (j * _gap) + irandom_range(-42, 42), "PARALLAX_1", obj_prophecy_mask, 
            {
                image_xscale: 1,
                image_yscale: 1,
                image_index: _get_prophecy(),
                image_blend: colour_bluenonsense,
                lay: 0
            });
        }
    }
}
_gap = 170;
for (var j = 0; j <= (1 + (prophspace_height div _gap)); j++)
{
    for (i = 0; i <= (1 + (prophspace_width div _gap)); i++)
    {
        instance_create_layer(50 + (i * _gap) + irandom_range(-52, 52), 50 + (j * _gap) + irandom_range(-52, 52), "PARALLAX_2", obj_prophecy_mask, 
        {
            image_xscale: 0.5,
            image_yscale: 0.5,
            image_alpha: 0.9,
            image_index: _get_prophecy(),
            image_blend: colour_bluenonsense,
            lay: 1
        });
    }
}
_gap = 96;
for (var j = 0; j <= (1 + (prophspace_height div _gap)); j++)
{
    for (i = 0; i <= (1 + (prophspace_width div _gap)); i++)
    {
        instance_create_layer(50 + (i * _gap) + irandom_range(-42, 42), 50 + (j * _gap) + irandom_range(-42, 42), "PARALLAX_3", obj_prophecy_mask, 
        {
            image_xscale: 0.25,
            image_yscale: 0.25,
            image_alpha: 0.85,
            image_index: _get_prophecy(),
            image_blend: colour_bluenonsense,
            lay: 2
        });
    }
}

MakeStarfield = function()
{
    surf_parallax_stars = surface_create(surf_width, surf_height);
    surface_set_target(surf_parallax_stars);
    draw_clear_alpha(c_black, 0);
    gpu_set_colorwriteenable(true, true, true, false);
    var _cx = camerax();
    var _cy = cameray();
    draw_sprite_tiled_ext(sprite_blueswirly, 0, 0, 0, 1, 1, c_white, 1);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_colorwriteenable(false, false, false, true);
    for (var j = 0; j <= (1 + (surf_height div 30)); j++)
    {
        for (var i = 0; i <= (1 + (surf_width div 30)); i++)
            draw_sprite(spr_whitepx, 0, (i * 30) + irandom_range(-12, 12), (j * 30) + irandom_range(-12, 12));
    }
    surface_reset_target();
};

ds_list_destroy(which_prophecy);
