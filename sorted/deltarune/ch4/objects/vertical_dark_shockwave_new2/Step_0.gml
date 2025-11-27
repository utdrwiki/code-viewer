timer++;
if (timer == 2)
    visible = true;
event_inherited();
if (image_xscale > 0)
    image_xscale -= 0.1;
if (image_yscale > 0)
    image_yscale -= 0.1;
else
    instance_destroy();
y = _y;
