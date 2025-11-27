scr_depth_alt();
if (canhit && !i_ex(myhitbox))
{
    myhitbox = instance_create(x, y, obj_susiezilla_activehitbox);
    myhitbox.sprite_index = spr_whitepx;
    myhitbox_xoffset = -24;
    myhitbox_yoffset = -28;
    myhitbox.image_yscale = 30;
    myhitbox.image_xscale = 40;
    myhitbox.depth = depth - 20;
    myhitbox.image_blend = c_yellow;
    myhitbox.daddy = id;
    myhitbox.visible = false;
}
if (i_ex(myhitbox))
{
    if (!canhit)
        safe_delete(myhitbox);
}
if (hitstop <= 0)
{
    if (fakeheight < 0)
        friction = 0;
    else
        friction = 0.85;
    if (i_ex(obj_susiezilla_player) && state != states.dead)
    {
        if (obj_susiezilla_player.x < (x - 24))
            facing = 0;
        else
            facing = 1;
    }
    if (x <= 10)
    {
        x = 10;
        hspeed = -hspeed / 2;
    }
    if (x >= 630)
    {
        x = 630;
        hspeed = -hspeed / 2;
    }
    if (y <= 200)
    {
        y = 200;
        vspeed = -vspeed / 2;
    }
    hitdir = direction;
    hitspeed = speed;
}
hitstop--;
if (hitstop == 0)
{
    canhit = 1;
    speed = memspeed;
    direction = memdir;
    fakevspeed = -6;
    fakegravity = 1;
    scr_lerpvar("image_index", 0, 2, 12);
    hitstop = -1;
}
if (hitstop > 0)
{
    kickactive = false;
    contimer = 0;
    con = 1;
    hopcount = 0 - irandom(2);
    flash = 0;
}
if (y >= 384)
{
    if (!fallcon)
    {
        fallcon = 1;
        snd_stop(snd_fall);
        snd_play(snd_fall);
        sprite_index = s_grab_fall;
        gravity = 1;
    }
}
if (y > (cameray() + 480 + 100))
    instance_destroy();
if (abs(hspeed) > fastestspeed)
    fastestspeed = abs(hspeed);
myxcenter = x - 6;
myycenter = (y - 34) + fakeheight;
