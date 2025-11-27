event_inherited();
scr_darksize();
value = 2;
states = 
{
    none: -1,
    idle: 0,
    flash: 1,
    kick: 2,
    jump: 3,
    dead: 4
};
state = states.none;
state_timer = 0;
s_idle = 3957;
s_hurt = 4335;
s_grab = 1093;
s_grab_rise = 4606;
s_grab_fall = 4458;
s_punch = 4501;
s_spin = 4335;
s_spin_large = 4335;
s_kick = 4377;
s_hadou = 4515;
s_fallen = 4314;
sprite_index = s_idle;
image_speed = 0.25;
y = clamp(y, 200, 380);
ystart = y;
if (i_ex(obj_susiezilla_statue))
{
    if (obj_susiezilla_statue.x < x)
        facing = 0;
    else
        facing = 1;
}
xanchor = x;
yanchor = y;
myxcenter = x;
myycenter = y;
fakeheight = -20;
maxheight = -20;
fric_var = 0.85;
hit_list = ds_list_create();
con = -1;
bobble = 0;
temp_counter = 0;
scr_lerpvar("ropeheight", -360, 0, 16, 1, "out");
alarm[0] = 16;
damage = 15;
knockback = 8;
timertarg1 = 15 + irandom_range(-2, 2);
timertarg2 = 30 + irandom_range(-2, 2);
falltimer = 0;
fallcon = 0;
fallpattern = 0;
