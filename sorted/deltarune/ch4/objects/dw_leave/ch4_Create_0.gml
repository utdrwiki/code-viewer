depth = 500000;
if (instance_exists(obj_dw_transition))
{
    instance_destroy();
    exit;
}
image_xscale = 2;
image_yscale = 2;
con = 0;
image_speed = 0;
kris_dist = 0;
draw_kris = 0;
kris_only = 1;
kris_x = x - 24;
kris_y = y - 80;
sus_x = x - 60;
sus_y = y - 94;
nextroom = 64;
fake_v = 0;
siner = 0;
drawpillar = 1;
pillarsiner = 0;
pillaralpha = 0;
pillarscale = 2;
particletimer = 0;
top = 0;
bottom = 1;
particle_active = true;
if (instance_number(obj_dw_leave_ch4) == 1)
{
    toppart = instance_create(x, y, obj_dw_leave_ch4);
    toppart.top = 1;
    toppart.bottom = 0;
    toppart.depth = 6000;
}
stopcon = 0;
border_fade = false;
scene_mode = false;
alphadist = 1;
kr_walktime = 0;
