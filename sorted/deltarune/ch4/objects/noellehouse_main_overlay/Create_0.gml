overlay_sprite = -4;
overlay_surface = -4;
overlay_alpha = 1;
heart_target = -4;
heart_radius = 0;
heart_siner = 0;
fall_mode = false;
heart_mode = true;
angel_mode = false;
glow_active = true;

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

set_angel_mode = function()
{
    heart_siner = 0;
    scr_lerpvar("heart_radius", heart_radius, 10, 15);
    angel_mode = true;
};
