event_inherited();
destroyonhit = 0;
grazepoints = 12;
owner = -4;
updateimageangle = false;
image_alpha = 0;
image_speed = 0;
image_index = 12;
image_xscale = 2;
image_yscale = 2;
vspeed = random_range(-2, -4);
hspeed = random_range(-5, 5);
max_speed = random_range(8, 10);
destroyonhit = 0;
mercified = false;
force_index = -1;
bulletpower = 1;
timer = 0;
slowed_rotate = 0;
slowdown = false;
gotopointer = false;
turn_rate = 0.1;
queue_lock = false;
rot_speed = (9 + random(4)) * choose(-1, 1);
tick_count = 0;
decel = -1;
finalnumber = 3;
if (i_ex(obj_volumeup))
{
    image_xscale = 2.5;
    image_yscale = 2.5;
    grazepoints += 1;
}
snd_stop(snd_wing);
snd_play_pitch(snd_wing, 1 + (instance_number(obj_bullet_dice) / 10));
