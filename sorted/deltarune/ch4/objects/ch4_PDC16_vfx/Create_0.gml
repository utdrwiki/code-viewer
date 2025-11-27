siner = 0;
window_siner = 0;
palette_index = 0;
window_alpha = 0.2;
layer_names = ["Compatibility_Tiles_Depth_1000000", "Compatibility_Tiles_Depth_995000", "Compatibility_Tiles_Depth_990000", "Compatibility_Tiles_Depth_5000"];
siner_active = false;
overlay_active = false;
bg_active = false;
window_active = false;
pal_swap_layer_init();
for (var i = 0; i < array_length(layer_names); i++)
{
    pal_swap_enable_layer(layer_names[i]);
    pal_swap_set_layer(4884, palette_index, layer_names[i], false);
}
pal_swap_reset();
with (obj_church_event)
    visible = false;
overlay_marker = scr_marker(-20, -20, spr_pixel_white);
with (overlay_marker)
{
    image_blend = #191F34;
    depth = 120;
    image_xscale = 200;
    image_yscale = 200;
}
