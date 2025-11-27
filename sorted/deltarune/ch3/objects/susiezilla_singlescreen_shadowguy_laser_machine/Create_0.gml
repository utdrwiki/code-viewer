event_inherited();
scr_darksize();
value = 100;
states = 
{
    none: -1,
    rope: 0,
    charge: 1,
    fire: 2,
    recharge: 3,
    dead: 4,
    hurt: 5
};
shake = 0;
polarity = 1;
tenna_panic = false;
hurt_counter = 0;
hurt_index = 0;
laser_width = 2;
laser_width_goal = 2;
laser_offset = 0;
laser_wobble = 0;
charge_index[0] = 4604;
charge_index[1] = 3542;
charge_index[2] = 4823;
charge_index[3] = 4291;
offset_index[0] = 0;
offset_index[1] = 1;
offset_index[2] = 4;
offset_index[3] = 12;
state = states.rope;
state_timer = 0;
hurt_timer = 0;
prev_state = 0;
maxhp = 12;
hp = maxhp;
image_speed = 0;
xanchor = x;
y = clamp(y, 200, 380);
myxcenter = x;
myycenter = y;
scr_lerpvar("ropeheight", -360, 0, 16, 1, "in");
facing = sign(obj_susiezilla_statue.x - x);
max_charge = 240;
rxo = 0;
ryo = 0;
ra = 0;
alarm[5] = 16;
snd_play_x(snd_drive, 0.5, 1.2);
