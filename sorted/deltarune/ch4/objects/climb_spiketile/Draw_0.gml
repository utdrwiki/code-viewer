if (scr_debug())
{
    if (keyboard_check_pressed(ord("V")))
        dodraw = !dodraw;
    if (!dodraw)
        exit;
}
if (view_current == 0)
    _siner++;
draw_sprite_ext(spr_pxwhite, 0, x, y, 40, 40, 0, c_black, 0.5);
draw_self();
var amt = -0.5 + (abs(sin(_siner / 30)) * 1.5);
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, 1, x, y, 2, 2, 0, c_white, amt);
gpu_set_blendmode(bm_normal);
