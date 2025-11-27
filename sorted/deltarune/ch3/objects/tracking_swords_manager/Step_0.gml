if (global.turntimer < 70)
    exit;
timer++;
if ((timer == rate && swordcount <= maxswords) || (timer == multiswordframes && multiswordcon == 1))
{
    inst = instance_create(x, y, obj_tracking_sword1);
    inst.direction = choose(0, 45, 90, 135, 180, 225, 270, 315);
    inst.variant = variant;
    inst.damage = damage;
    repeat (8)
    {
        for (i = 0; i < 8; i++)
        {
            if (inst.direction == directionprev[i])
                inst.direction += 45;
        }
    }
    inst.image_angle = inst.direction + 180;
    directionprev[swordcount] = inst.direction;
    for (i = 1; i < 4; i++)
    {
        var _a = i + swordcount;
        if (_a > 7)
            _a -= 7;
        directionprev[_a] = -1;
    }
    swordcount++;
    if (swordcount > maxswords && variant == 0)
        global.turntimer = 70;
    if (swordcount > maxswords && variant == 1)
        global.turntimer = 120;
    if (swordcount > 7 && swordcount < maxswords)
        swordcount = 0;
    setcount++;
    if (setdirection[setcount] != -1)
        inst.direction = setdirection[setcount];
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
        x = obj_heart.x + 10 + lengthdir_x(len, direction);
        y = obj_heart.y + 10 + lengthdir_y(len, direction);
        ystart = y;
        image_angle = direction + 180;
    }
    rate -= ratedecay;
    if (rate < rateminimum)
        rate = rateminimum;
    timer = 0;
}
