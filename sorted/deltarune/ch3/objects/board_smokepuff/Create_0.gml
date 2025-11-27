image_index = 0;
image_speed = 0;
lastframe = sprite_get_number(sprite_index) - 1;
scr_darksize();
depth = 100000;
init = 0;
image_blend = #C9C9C9;
if (room == room_dw_teevie_shadow_guys)
{
    depth = 100001;
    setxy(scr_even(x), scr_even(y));
}
if (room == room_dw_b3bs_extrapuzzle || room == room_dw_b3bs_mysterypuzzle || room == room_dw_b3bs_bibliox)
    depth = 100001;
