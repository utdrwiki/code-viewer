timer++;
finishtimer++;
var _xx = camerax() + 320;
var _yy = cameray() + 180;
if (i_ex(obj_growtangle))
{
    _xx = obj_growtangle.x;
    _yy = obj_growtangle.y;
}
if (finishtimer == finishtimermax)
{
    con = 1;
    with (obj_sword_tunnel_sword)
        con = 1;
}
if (timer >= rate && con == 0)
{
    if (tobymode == 0)
    {
        sword = instance_create(swordx, swordy - 50 - (gapsize / 2), obj_sword_tunnel_sword);
        sword.image_angle = 270;
        sword.damage = damage;
        sword = instance_create(swordx, swordy + 50 + (gapsize / 2), obj_sword_tunnel_sword);
        sword.image_angle = 90;
        sword.damage = damage;
    }
    else if (tobymode == 1)
    {
        tobytimer++;
        sword = instance_create(swordx, swordy - 50 - (gapsize / 2), obj_sword_tunnel_sword);
        sword.image_angle = 270;
        sword._speed += (sin(tobytimer / 6) * 16) + random(1);
        sword.damage = damage;
        sword = instance_create(swordx, swordy + 50 + (gapsize / 2), obj_sword_tunnel_sword);
        sword.image_angle = 90;
        sword._speed += (sin(tobytimer / 6) * 16) + random(1);
        timer = max(0, sin(tobytimer / 6) * 2);
        sword.damage = damage;
    }
    else if (tobymode == 2)
    {
        var sx = lengthdir_x(swordxrel, sworddirection + 180);
        var sy = lengthdir_y(swordxrel, sworddirection + 180);
        var syaddy = lengthdir_y(swordy - obj_growtangle.y, sworddirection + 270);
        var syaddx = lengthdir_x(swordy - obj_growtangle.y, sworddirection + 270);
        var sgapy = lengthdir_y(gapsize, sworddirection + 270) * 2;
        var sgapx = lengthdir_x(gapsize, sworddirection + 270) * 2;
        tobytimer++;
        sword = instance_create(((_xx + sx) - sgapx) + syaddx, ((_yy + sy) - sgapy) + syaddy, obj_sword_tunnel_sword);
        sword.image_angle = sworddirection + 270;
        sword.mydirection = sworddirection;
        sword.damage = damage;
        var speedproportion = lerp(1, 0.8, abs(lengthdir_y(1, sworddirection + 180)));
        sword._speed = -8 * speedproportion;
        sword._gravity = 2 * speedproportion;
        sword.damage = damage;
        sword = instance_create(_xx + sx + sgapx + syaddx, _yy + sy + sgapy + syaddy, obj_sword_tunnel_sword);
        sword.image_angle = sworddirection + 90;
        sword.mydirection = sworddirection;
        sword._speed = -8 * speedproportion;
        sword._gravity = 2 * speedproportion;
        sword.damage = damage;
        sworddirection += 4;
    }
    else if (tobymode == 3)
    {
        tobytimer++;
        if (!tobyvolleymode)
        {
            verticalchange = abs(sin(tobytimer / 8)) * 5;
            gapsize = 34 + (verticalchange * 1.4);
        }
        var sx = lengthdir_x(swordxrel, sworddirection + 180);
        var sy = lengthdir_y(swordxrel, sworddirection + 180);
        var syaddy = lengthdir_y(swordy - obj_growtangle.y, sworddirection + 270);
        var syaddx = lengthdir_x(swordy - obj_growtangle.y, sworddirection + 270);
        var sgapy = lengthdir_y(gapsize, sworddirection + 270) * 2;
        var sgapx = lengthdir_x(gapsize, sworddirection + 270) * 2;
        tobytimer++;
        sword = instance_create(((_xx + sx) - sgapx) + syaddx, ((_yy + sy) - sgapy) + syaddy, obj_sword_tunnel_sword);
        sword.image_angle = sworddirection + 270;
        sword.mydirection = sworddirection;
        sword.damage = damage;
        var speedproportion = lerp(1, 0.8, abs(lengthdir_y(1, sworddirection + 180)));
        sword._speed = -8 * speedproportion;
        sword._gravity = 2 * speedproportion;
        sword._gravity = ((2 * speedproportion) - (verticalchange / 15)) * tobyvolleymodeinitspeed;
        sword.damage = damage;
        sword = instance_create(_xx + sx + sgapx + syaddx, _yy + sy + sgapy + syaddy, obj_sword_tunnel_sword);
        sword.image_angle = sworddirection + 90;
        sword.mydirection = sworddirection;
        sword._speed = -8 * speedproportion;
        sword._gravity = 2 * speedproportion;
        sword._gravity = ((2 * speedproportion) - (verticalchange / 15)) * tobyvolleymodeinitspeed;
        sword.damage = damage;
        sworddirection += 8;
    }
    if (movedirection == "up")
        swordy -= verticalchange;
    if (movedirection == "down")
        swordy += verticalchange;
    swordcount++;
    if ((setcount == swordcount && (movedirection == "down" || movedirection == "up")) || (waitsetcount == swordcount && movedirection == "none"))
    {
        swordcount = 0;
        setcount = choose(2, 3, 4);
        waitsetcount = choose(1, 2, 3);
        if (tobymode == 2)
        {
            setcount = choose(4, 6, 8);
            waitsetcount = choose(2, 4, 6);
            if (tobyvolleymode)
            {
                setcount = choose(6, 10, 12);
                waitsetcount = choose(6, 8, 12);
            }
        }
        if (movedirection == "none")
            movedirection = choose("up", "down");
        else
            movedirection = "none";
        if (movedirection == "up" && swordy < (obj_growtangle.y - 20))
            movedirection = "down";
        if (movedirection == "down" && swordy > (obj_growtangle.y + 20))
            movedirection = "up";
    }
}
if (timer >= rate && stopsfxtimer < 3)
{
    if (con == 1)
        stopsfxtimer++;
    snd_play_x(snd_heavy_passing, 0.3, 1.2);
    timer = 0;
}
if (swordcount >= maxswords)
    instance_destroy();
