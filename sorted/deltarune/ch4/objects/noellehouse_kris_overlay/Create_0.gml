depth = 5000;
overlay_sprite = -4;
overlay_surface = -4;
overlay_alpha = 0.5;
target = -4;
heart_radius = 20;
heart_siner = 0;
fall_mode = false;
heart_mode = true;
angel_mode = false;
glow_active = true;
overlay_active = false;
pulse_timer = 0;
pulse_time = 90;

set_alpha = function(arg0)
{
    overlay_alpha = arg0;
};

fade_in = function(arg0 = 90)
{
    scr_lerpvar("overlay_alpha", 1, overlay_alpha, arg0);
};

fade_out = function(arg0 = 90)
{
    scr_lerpvar("overlay_alpha", overlay_alpha, 0, arg0);
};

pulse_dark = function()
{
    snd_play_x(snd_bump, 0.4, 0.4);
    scr_lerpvar("overlay_alpha", overlay_alpha - 0.05, overlay_alpha, 80, 3, "out");
};

hide = function()
{
    set_alpha(1);
};

show = function()
{
    set_alpha(overlay_alpha);
};

set_target = function(arg0)
{
    target = arg0;
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
