alt = 0;
depth = 900000;
_light_marker = scr_dark_marker(x + 20, y + 20, spr_dw_teevie_floor_light);
_light_marker.image_alpha = 0.15;
with (_light_marker)
{
    scr_depth();
    depth += 410;
}
_is_active = false;
_is_paused = false;
_depth_temp = 0;

turn_on = function()
{
    with (_light_marker)
        scr_lerpvar("image_alpha", 0.15, 0.35, 15, 2, "out");
};

turn_off = function()
{
    with (_light_marker)
        scr_lerpvar("image_alpha", 0.35, 0.15, 15, 2, "out");
};

pause_toggle = function()
{
    _is_paused = true;
    _depth_temp = depth;
    depth = 1000150;
    with (_light_marker)
        scr_lerpvar("image_alpha", image_alpha, 0, 15, 2, "out");
};

unpause_toggle = function()
{
    _is_paused = false;
    depth = _depth_temp;
    alarm[0] = 1;
};

if (room == room_dw_teevie_watercooler)
{
    depth = 1199900;
    with (_light_marker)
        scr_depth_alt();
    alt = 1;
    _is_active = true;
}
