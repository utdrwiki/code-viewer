if (fadeout)
    exit;
fadeout = true;
global.interact = 1;
instance_create(0, 0, obj_fadeout);
var start_x = (x + (sprite_width / 2)) - (sprite_get_width(spr_heartsmall) / 2);
var start_y = y + 10;
var vent_cover = scr_marker(x, y, spr_noellehouse_vent_open_cover);
vent_cover.depth = obj_homealone_heart.depth + 10;
with (vent_cover)
    scr_delay_var("depth", obj_homealone_heart.depth - 10, 6);
with (obj_homealone_heart)
{
    scr_lerpvar("x", x, start_x, 5);
    scr_lerpvar("y", y, start_y, 5);
    scr_script_delayed(scr_lerpvar, 6, "y", start_y, start_y - 10, 10);
}
alarm[1] = 15;
