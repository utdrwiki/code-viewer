var _yoff = (cameray() - obj_rhythmgame.y) * pan_mul;
if (snap)
    _yoff = round(_yoff);
draw_self_offset(0, _yoff);
