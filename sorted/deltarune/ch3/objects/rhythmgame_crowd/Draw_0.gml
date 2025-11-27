var _yoff = (cameray() - obj_rhythmgame.y) * pan_mul;
if (snap)
    _yoff = round(_yoff);
var _sin = clamp01(sin(siner));
if (cheer || siner < 15)
{
    siner = scr_loop(siner + 1, 30);
    _yoff += (clamp01(sin((siner / 20) * pi)) * 40 * pan_mul);
}
draw_self_offset(0, _yoff);
