scr_depth_alt();
if (washit == true)
{
    var lifetimer = 120;
    hittimer++;
    if (hittimer > (lifetimer * (1/3)) && hittimer < (lifetimer * (2/3)))
    {
        if ((hittimer % 4) == 0)
            image_index = 1 - image_index;
    }
    if (hittimer > (lifetimer * (2/3)) && hittimer < (lifetimer * 0.8333333333333334))
    {
        if ((hittimer % 3) == 0)
            image_index = 1 - image_index;
    }
    if (hittimer > (lifetimer * 0.8333333333333334))
    {
        if ((hittimer % 2) == 0)
            image_index = 1 - image_index;
    }
    if (hittimer > (lifetimer * 0.9666666666666667))
        image_index = 1;
    if (hittimer >= lifetimer)
    {
        snd_play(snd_explosion_mmx3);
        var __amt = irandom(3) + 6;
        for (var i = 0; i < __amt; i++)
        {
            dust = scr_dark_marker_playonce(x - (sprite_width / 2), (y - (sprite_height / 2)) + fakeheight, spr_susiezilla_houseexplosion);
            dust.direction = (i / __amt) * 360;
            dust.speed = 3.5 + random_range(-0.2, 0.2);
            dust.friction = 0.25;
            dust.image_speed = 0.25 + random_range(-0.1, 0.1);
            scr_lerp_instance_var(dust, "image_xscale", 0.5, 2, 5);
            scr_lerp_instance_var(dust, "image_yscale", 0.5, 2, 5);
            with (dust)
                scr_depth_alt();
        }
        instance_destroy();
    }
}
if (canhit == true && !i_ex(myhitbox))
{
    myhitbox = instance_create(x, y, obj_susiezilla_activehitbox);
    myhitbox.sprite_index = spr_susiezilla_ball_hitbox;
    myhitbox.image_yscale = 2;
    myhitbox.image_xscale = 2;
    myhitbox.depth = depth - 20;
    myhitbox.image_blend = c_yellow;
    myhitbox.image_alpha = 0.2;
    myhitbox.daddy = id;
    myhitbox.visible = false;
}
if (i_ex(myhitbox))
{
    if (canhit == false)
        safe_delete(myhitbox);
}
iframes--;
if (hitstop <= 0)
{
    fakevspeed += fakegravity;
    fakeheight += fakevspeed;
    if (fakeheight >= 0)
    {
        if (washit == 0 && canhit == true)
        {
            snd_play(snd_board_bomb);
            washit = true;
        }
        fakevspeed = 0;
        fakeheight = 0;
        if (abs(hspeed) > 4)
        {
            fakevspeed = -abs(speed) / 2;
            fakevspeed = clamp(fakevspeed, -2, fakevspeed);
        }
        if (bounce == 0)
        {
            bounce++;
            iframes = 0;
            fakevspeed = -4;
        }
    }
    friction = 0.125;
    if (abs(speed) < 4 && fakeheight > -1)
        canhit = 0;
    if (x <= 40)
    {
        x = 40;
        hspeed = -hspeed / 2;
    }
    if (x >= 600)
    {
        x = 600;
        hspeed = -hspeed / 2;
    }
    if (y <= 186)
    {
        y = 186;
        vspeed = -vspeed / 2;
    }
    if (y >= 340)
    {
        y = 340;
        vspeed = -vspeed / 2;
    }
    hitdir = direction;
    hitspeed = speed;
    drawshake--;
}
hitstop--;
if (hitstop == 0)
{
    canhit = 1;
    speed = memspeed * 1.5;
    direction = memdir;
    fakevspeed = -8;
    fakegravity = 0.65;
    hitstop = -1;
    iframes = 15;
    washit = true;
}
myxcenter = x;
myycenter = y + fakeheight;
var maxspeed = 64;
speed = clamp(speed, -maxspeed, maxspeed);
