timer++;
siner++;
if ((timer == rate && swordcount < maxswords) || (timer == multiswordframes && multiswordcon == 1))
{
    inst = instance_create(obj_growtangle.x, obj_growtangle.y, obj_sword_vortex);
    inst.dir = choose(0, 45, 90, 135, 180, 225, 270, 315);
    inst.variant = variant;
    inst.sinpower = sinpower;
    inst.sinspeed = sinspeed;
    inst.len = startinglen;
    inst.lenstart = inst.len;
    inst.shrinkrate = shrinkrate;
    inst.damage = damage;
    inst.target = target;
    swordcount++;
    setcount++;
    if (setdirection[setcount] != -1)
        inst.dir = setdirection[setcount];
    if (multiswordmax > 0)
        multiswordcount++;
    if (multiswordcon == 0 && multiswordmax > 0)
        multiswordcon = 1;
    if (multiswordcon == 1 && multiswordcount == multiswordmax)
    {
        multiswordcon = 0;
        multiswordcount = 0;
    }
    with (inst)
    {
        x = xstart + lengthdir_x(len, dir);
        y = ystart + lengthdir_y(len, dir);
        image_angle = dir - 90;
    }
    rate -= ratedecay;
    if (rate < rateminimum)
        rate = rateminimum;
    timer = 0;
}
if (centermoves == 1)
{
    if (centermovescon == 0)
    {
        startx = swordcirclecenterx;
        starty = swordcirclecentery;
        targetx = (obj_growtangle.x - 60) + irandom(120);
        targety = (obj_growtangle.y - 60) + irandom(120);
        centermovescon = 1;
    }
    if (centermovescon == 1)
    {
        centermovestimer++;
        swordcirclecenterx = lerp(startx, targetx, centermovestimer / movespeed);
        swordcirclecentery = lerp(starty, targety, centermovestimer / movespeed);
        if (centermovestimer == movespeed)
        {
            centermovestimer = 0;
            centermovescon = 0;
        }
    }
}
