scr_depth();
var _collider = instance_create(x + 10, y + 120, obj_solidblocksized);
with (_collider)
{
    image_xscale = 1.5;
    image_yscale = 0.75;
}
if (image_xscale < 0)
    _collider.x -= 80;
if (room == room_dw_b3bs_interstitial)
    depth = 900000;
