speed = random_range(10, 30);
friction = 2;
fallspeed = -random_range(20, 30);
siner = random(94.24777960769379);
image_blend = choose(#5555FF, #55FF55, #FF5555, c_aqua, c_orange);
version = 0;
if (global.chapter == 3 && i_ex(obj_rouxls_ch3_enemy))
{
    version = 1;
    speed = random_range(4, 8);
    fallspeed = -random_range(15, 25);
    image_blend = make_color_rgb(224, 224, 192);
    image_index = irandom(5);
}
height = 1;
airborne = true;
destroyOnLand = false;
falltime = 0;
init = false;
maxDepth = 800100;
fallFriction = friction;
miny = 320;
maxy = 340;
shadow = -4;
image_xscale = 2;
image_yscale = 2;
topdrop = 0;
bottomdrop = 0;
shine_index = 0;
lifetime = 30;
preload = false;
preload_speed = 0;
fade = 0;
start_depth = 100000;
rearDepth = 1000100;
