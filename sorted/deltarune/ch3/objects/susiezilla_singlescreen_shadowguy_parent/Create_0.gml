iframes = 0;
hitcon = 0;
ydes = ystart;
xdes = xstart;
con = 0;
state = 0;
state_timer = 0;
myhealth = 2;
facing = 0;
ropeheight = -360;
ropeheight2 = 0;
fakeheight = 0;
fakegravity = 1;
fakevspeed = 0;
canhit = false;
damage = 10;
knockback = 5;
memspeed = speed;
memdir = direction;
hitspeed = 0;
hitdir = 0;
drawshake = 0;
hitstop = 0;
myhitbox = 0;
hittimer = 0;
fastestspeed = 0;
con = 0;
contimer = 0;
mark_counter = 2;
value = 1;
gameover = false;
desx = xstart;
desy = ystart;
myhitscale = 4;
hopcount = 0;
kickactive = false;
flash = 0;
remfacing = 0;
attacktime = 1;
fallcon = 0;
with (obj_susiezilla_gamecontroller)
    show_spawned++;

polar_facing = function(arg0)
{
    if (arg0 == 1)
        return 1;
    if (arg0 == 0)
        return -1;
    if (arg0 == -1)
        return -1;
    return 0;
};

instant_defeat = function()
{
    value = 0;
    if (state == states.dead)
        exit;
    if (ropeheight != 0)
    {
        with (obj_lerpvar)
        {
            if (target == other.id)
                instance_destroy();
        }
        with (obj_script_delayed)
        {
            if (target == other.id)
                instance_destroy();
        }
    }
    sprite_index = s_hurt;
    image_index = 0;
    image_speed = 0;
    state = states.dead;
    state_timer = 0;
    alarm[0] = -1;
    hittimer = 0;
    hitstop = 4;
    drawshake = hitstop;
    canhit = true;
    memspeed = 8 + irandom_range(-1, 1);
    memdir = point_direction(obj_susiezilla_player.myxcenter, obj_susiezilla_player.myycenter, x, y);
    with (obj_susiezilla_gamecontroller)
        check_enemies();
};
