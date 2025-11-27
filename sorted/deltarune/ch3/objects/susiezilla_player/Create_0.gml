scr_darksize();
event_inherited();
image_xscale = 2;
image_yscale = 2;
tennainit = false;
if (i_ex(obj_tenna_enemy))
    visible = false;
dashcon = 0;
canmove = 1;
facing = 0;
accel = 0.9;
maxspeed = 16;
hitstop = -1;
memhspeed = hspeed;
memvspeed = vspeed;
memspeed = speed;
memimagespeed = image_speed;
memmaxspeed = 0;
memaccel = 0;
memdir = 0;
hitcooldown = 12;
hitduration = 4;
hitactive = false;
drawshake = 0;
myxcenter = x + 32;
myycenter = y + 40;
oldxcenter = x;
oldycenter = y;
myhitscale = 1;
button1buffer = 0;
button1con = 0;
button1holdtime = 0;
attackqueued = 0;
dashlength = 15;
maxspeedbonus = 0;
recoverytime = 8;
buttonflash = 0;
invuln = 0;
gameover = false;
s_idle = 4263;
s_forward = 2786;
s_backward = 4199;
s_hurt = 3943;
s_prepare = 4601;
s_attack = 4639;
s_postattack = 4453;
target = 0;
damage = 0;
alarm[1] = 20;
if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity)
    alarm[1] = 1;

take_hit = function(arg0, arg1, arg2)
{
    if (dashcon == 2 || !canmove || invuln || (i_ex(obj_tenna_enemy) && obj_tenna_enemy.con > 1))
        exit;
    damage = arg1;
    if (i_ex(obj_tenna_enemy))
    {
        global.inv = -1;
        obj_tenna_enemy.minigamefailcount++;
    }
    if (arg0 != 1)
        direction = random_range(135, 225);
    else
        direction = random_range(-45, 45);
    event_user(0);
    hitstop = 4;
    drawshake = hitstop;
    memhspeed = 0;
    memvspeed = 0;
    memspeed = arg2;
    memmaxspeed = arg2;
    memaccel = accel;
    memimagespeed = image_speed;
    canmove = -(arg2 + 10);
    alarm[0] = 10;
    button1con = 0;
    hitactive = 0;
    dashcon = 0;
    dashtimer = 0;
    button1holdtime = 0;
    buttonflash = 0;
    attackqueued = 0;
    button1buffer = 0;
    snd_stop(snd_punchmed);
    snd_play_pitch(snd_punchmed, 0.75);
};

take_hit_unblockable = function(arg0, arg1, arg2)
{
    if (!canmove || invuln || (i_ex(obj_tenna_enemy) && obj_tenna_enemy.con > 1))
        exit;
    damage = arg1;
    with (obj_tenna_zoom)
        hurt_counter++;
    if (i_ex(obj_tenna_enemy))
    {
        global.inv = -1;
        obj_tenna_enemy.minigamefailcount++;
        if (obj_tenna_enemy.minigamefailcount > 2 && obj_tenna_zoom.con != 2 && obj_tenna_zoom.minigameinsanity == false)
        {
            with (obj_tenna_zoom)
            {
                con = 2;
                timer = -30;
            }
        }
    }
    if (arg0 != 1)
        direction = random_range(135, 225);
    else
        direction = random_range(-45, 45);
    event_user(0);
    hitstop = 4;
    drawshake = hitstop;
    memhspeed = 0;
    memvspeed = 0;
    memspeed = arg2;
    memmaxspeed = arg2;
    memaccel = accel;
    memimagespeed = image_speed;
    canmove = -(arg2 + 10);
    alarm[0] = 10;
    button1con = 0;
    hitactive = 0;
    dashcon = 0;
    dashtimer = 0;
    button1holdtime = 0;
    buttonflash = 0;
    attackqueued = 0;
    button1buffer = 0;
    snd_stop(snd_punchmed);
    snd_play_pitch(snd_punchmed, 0.75);
};
