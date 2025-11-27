if (con < 0)
    exit;
warp_timer++;
if ((warp_timer % 60) == 1)
{
    var _anim_time = 8;
    scr_lerpvar("anim", 0, 5, _anim_time);
    scr_delay_var("anim", 0, _anim_time + 1);
}
draw_sprite_ext(scr_84_get_sprite("spr_dw_screen_technical_difficulties"), anim, camerax(), cameray(), 1, 1, 0, c_white, 1);
