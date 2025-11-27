depth = 4000;
circle_radius = 40;
is_active = true;
is_init = false;
dess_closet_fade_in = false;
dess_closet_alpha = 0.5;
dess_closet_alpha_target = 0;
dess_room_alpha = 0.5;
dess_room_alpha_target = 0.5;
dess_closet_cover = false;

hide = function()
{
    is_active = false;
    circle_radius = 200;
};

show = function()
{
    is_active = true;
    scr_lerpvar("circle_radius", circle_radius, 40, 60, 3, "out");
};
