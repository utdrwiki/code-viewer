scr_depth();
if (active == 0)
{
    safe_delete(obj_candle_flamebullet);
    x = lerp(x, xstart, 0.05);
    y = lerp(y, ystart, 0.05);
    if (x < ((camerax() + 640) - (sprite_width / 2)) && obj_mainchara.battlemode == 1)
        active = 1;
}
if (active == 1)
{
    if (obj_mainchara.battlemode == 0)
        active = 0;
    desx = camerax() + 320 + (sin(siner / 20) * 20);
    desy = 40 + (cos(siner / 10) * 20);
    x = lerp(x, desx, 0.05);
    y = lerp(y, desy, 0.05);
    if (global.interact == 0)
        siner++;
    xmid = x + (sprite_width / 2);
    ymid = y + (sprite_height / 2);
    lightx = xmid + lengthdir_x(40, point_direction(xmid, ymid, obj_mainchara.x + (obj_mainchara.sprite_width / 2), obj_mainchara.y + (obj_mainchara.sprite_height / 2)));
    lighty = ymid + lengthdir_y(40, point_direction(xmid, ymid, obj_mainchara.x + (obj_mainchara.sprite_width / 2), obj_mainchara.y + (obj_mainchara.sprite_height / 2)));
    if (con == 0)
    {
        myball = instance_create(lightx, lighty, obj_candle_flamebullet);
        timer = 0;
        con++;
    }
    if (con == 1)
    {
        if (global.interact == 0)
            timer++;
        var timertarg = 25;
        if (timer > timertarg)
            timer = timertarg;
        if (i_ex(myball))
        {
            myball.x = lightx;
            myball.y = lighty;
            myball.image_xscale = timer / timertarg;
            myball.image_yscale = timer / timertarg;
        }
        if (timer >= timertarg)
            con = 2;
    }
    if (con == 2 && i_ex(obj_mainchara))
    {
        if (i_ex(myball))
        {
            myball.direction = point_direction(myball.x, myball.y, obj_mainchara.x + (obj_mainchara.sprite_width / 2), obj_mainchara.y);
            myball.speed = 4;
            myball.friction = -0.5;
            myball = 0;
        }
        timer = 0;
        con = 3;
    }
    if (con == 3)
    {
        timer++;
        if (timer == 10)
            con = 0;
    }
}
if (active == 2)
{
    with (obj_overworld_bulletarea)
        y = room_height * 2;
    desx = camerax() + 320 + (sin(siner / 20) * 20);
    desy = -sprite_width * 2;
    x = lerp(x, desx, 0.125);
    y = lerp(y, desy, 0.05);
    image_alpha *= 0.9;
    if (y == desy)
        instance_destroy();
}
draw_self();
