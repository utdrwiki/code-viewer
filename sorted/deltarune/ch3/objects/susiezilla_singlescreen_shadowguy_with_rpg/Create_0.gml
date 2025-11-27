event_inherited();
scr_darksize();
value = 5;
states = 
{
    none: -1,
    rope: 0,
    idle: 1,
    fire: 2,
    dead: 3
};
state = states.rope;
state_timer = 0;
shoot_angle = 0;
s_idle = 1408;
s_fire = 4427;
s_hurt = 3266;
s_grab = 1093;
s_grab_rise = 4606;
s_grab_fall = 4458;
s_fallen = 4314;
sprite_index = s_idle;
image_speed = 0.25;
y = clamp(y, 200, 380);
ystart = y;
xanchor = x;
yanchor = y;
myxcenter = x;
myycenter = y;
fakeheight = -20;
maxheight = -20;
bobble = 0;
fric_var = 0.85;
state = states.rope;
scr_lerpvar("ropeheight", -360, 0, 16, 1, "out");
scr_script_delayed(scr_var, 16, "con", 0);
