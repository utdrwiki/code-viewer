scr_bullet_init();
spin = 0;
spinspeed = 0;
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 1;
bottomfade = 0;
green = 0;
highlight = 0;
greentimer = 0;
parentid = -4;
playpianosfx = 0;
touchingplayer = 0;
particletimer = 0;
chorus = 0;
grazepoints = 10;
with (obj_growtangle)
    other.depth = depth - 2;
