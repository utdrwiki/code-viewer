active = 0;
if (i_ex(obj_mainchara) && obj_mainchara.battlemode == 1)
    active = 1;
if (con == 0)
{
    timer++;
    if (timer % 2)
        visible = false;
    else
        visible = true;
    if (timer == 10)
    {
        timer = 0;
        con = 1;
        distancex = xstart - targetx;
        distancey = ystart - targety;
    }
    depth = -9999999999999;
}
if (con == 1)
{
    timer += 1;
    if (bouncy == 0)
    {
        x = lerp(xstart, targetx, timer / 60);
        y = lerp(ystart, targety, timer / 60);
        fakey = -15 + (sin(timer / 19) * 200 * -1);
        if (timer == 60)
        {
            depth = savedepth;
            timer = 0;
            con = 2;
        }
    }
    else
    {
        x = lerp(xstart, targetx, timer / 20);
        y = lerp(ystart, targety, timer / 20);
        fakey = -4 + (sin(timer / 7.1) * 100 * -1);
        if (timer == 20)
        {
            depth = savedepth;
            timer = 0;
            con = 2;
        }
    }
}
if (con == 2)
{
    timer++;
    if (bouncy == 0 && timer == 10)
        hitwall = 1;
    if (bouncy == 1 && timer == 1)
    {
        xstart = x;
        ystart = y;
        targetx -= distancex;
        targety -= distancey;
        timer = 0;
        con = 1;
    }
}
if (global.inv < 0 && obj_mainchara.battlemode == 1 && ((con == 2 && timer < 4) || (con == 1 && timer > 55) || (con == 1 && timer < 5)))
{
    if (collision_rectangle(x - 6, (y - 10) + fakey, x, y + 12 + fakey, obj_mainchara, true, true))
        event_user(5);
}
if (hitwall == 1)
{
    active = 0;
    speed = 0;
    image_xscale = lerp(image_xscale, -1, 0.07);
    image_yscale = lerp(image_yscale, -1, 0.07);
}
if (i_ex(mylight))
{
    mylight.smallerLight = 120 * image_alpha;
    mylight.biggerLight = mylight.smallerLight * 1.15;
}
if (active == 0)
    image_alpha = lerp(image_alpha, -1, 0.07);
if (image_alpha < 0)
    instance_destroy();
if (x < 0)
    instance_destroy();
