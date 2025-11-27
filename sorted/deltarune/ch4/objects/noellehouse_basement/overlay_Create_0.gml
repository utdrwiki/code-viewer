overlay_sprite = -4;
overlay_surface = -4;
overlay_alpha = 1;
heart_target = -4;
heart_radius = 0;
heart_siner = 0;
radius_offset = 0.5;
fall_mode = false;
heart_mode = true;
angel_mode = false;
glow_active = true;
tree_target = -4;
tree_overlay = scr_marker(0, 0, spr_noellehouse_basement_tree);
with (tree_overlay)
{
    image_blend = c_black;
    depth = 5000;
}
angel_target = -4;
angel_overlay = scr_marker(0, 0, spr_noellehouse_basement_angel);
angel_overlay.image_blend = c_black;
angel_overlay.depth = 4900;
noelle_light_target = -4;
noelle_light_mask = -4;
susie_light_target = -4;
susie_light_mask = -4;

set_alpha = function(arg0)
{
    overlay_alpha = arg0;
};

fade_in = function(arg0 = 90)
{
    scr_lerpvar("overlay_alpha", overlay_alpha, 1, arg0);
};

fade_out = function(arg0 = 90)
{
    scr_lerpvar("overlay_alpha", overlay_alpha, 0, arg0);
};

hide = function()
{
    set_alpha(0);
};

show = function()
{
    set_alpha(overlay_alpha);
};

set_heart_target = function(arg0)
{
    heart_target = arg0;
};

heart_glow_show = function()
{
    heart_siner = 0;
    scr_lerpvar("heart_radius", heart_radius, 10, 15);
};

heart_glow_hide = function()
{
    glow_active = false;
    heart_radius = 0;
    heart_mode = false;
    angel_mode = false;
};

set_fall_mode = function(arg0)
{
    fall_mode = arg0;
    heart_mode = false;
};

set_angel_mode = function()
{
    glow_active = true;
    heart_siner = 0;
    fall_mode = false;
    scr_lerpvar("heart_radius", heart_radius, 10, 15);
    angel_mode = true;
};
