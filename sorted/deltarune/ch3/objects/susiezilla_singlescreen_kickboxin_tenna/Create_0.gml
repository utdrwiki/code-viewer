scr_darksize();
tennainit = false;
if (i_ex(obj_tenna_enemy))
    visible = false;
states = 
{
    breakout: -1,
    idle: 0,
    kick: 1,
    zip: 2,
    twirl: 3,
    pain: 4,
    dead: 5,
    given_up: 6
};
turbo = false;
state_timer = -30;
state = states.breakout;
maxhp = 2;
hp = maxhp;
juke_offset = 0;
juke_direction = 1;
juke_counter = 0;
dest_x = x;
dest_y = y;
z = 0;
zspeed = 0;
zgrav = 1;
fric = 0.85;
do_shadow = false;
idle_loop = false;
kick_loop = false;
idle_dir = 0.25;
image_speed = 0;
xoff = 0;
yoff = 0;
polarity = 1;
xscale = 2;
yscale = 2;
myhitscale = 4;
mid = obj_susiezilla_gamecontroller.xorig + (obj_susiezilla_gamecontroller.width * 0.5);
myxcenter = x;
myycenter = y;
bounciness = 0.25;
side = -1;
doshadow = false;
flash = 0;
afterimages = false;
afterimages_intensity = 0;
hit_list = ds_list_create();
facing = 0;
damage = 2;
knockback = 16;
zip_dir = choose(-1, 1);
my_intent = "";
falltimer = 0;
fallcon = 0;
fallpattern = 0;
createspotlights = false;
anchor_x = mid + 180;
anchor_y = y;

give_up = function()
{
    idle_loop = false;
    kick_loop = false;
    sprite_index = spr_tenna_desperate;
    image_index = 3;
    image_speed = 0;
    snd_play(snd_screenshake);
    with (obj_susiezilla_gamecontroller)
        shake = 4;
    with (obj_spotlightlaser)
        instance_destroy();
    afterimages = false;
    speed *= 0.5;
    fric *= 0.5;
    state = states.given_up;
    bounciness = 0.25;
    xscale = -2.5 * side;
    yscale = 1.5;
    alarm[0] = -1;
    alarm[1] = -1;
};

if ((i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity) || (i_ex(obj_tenna_enemy) && obj_tenna_enemy.alreadydidgianttenna))
{
    sprite_index = spr_tenna_kick;
    image_index = 0;
    x += 100;
    idle_loop = true;
    anchor_x = mid + 180;
    state = states.idle;
    if (obj_tenna_zoom.minigameinsanity)
        state_timer = irandom(7);
    else
        state_timer = -42;
}
with (obj_tenna_enemy)
    alreadydidgianttenna = true;
