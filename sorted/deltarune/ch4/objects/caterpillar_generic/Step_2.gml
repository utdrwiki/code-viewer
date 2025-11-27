if (!init)
{
    if (!variable_instance_exists(id, "dsprite"))
        dsprite = sprite_index;
    if (!variable_instance_exists(id, "rsprite"))
        rsprite = sprite_index;
    if (!variable_instance_exists(id, "usprite"))
        usprite = sprite_index;
    if (!variable_instance_exists(id, "lsprite"))
        lsprite = sprite_index;
    sprite_index = dsprite;
    if (memory != 75)
    {
        for (var i = 0; i < memory; i += 1)
        {
            remx[i] = daddy.x;
            remy[i] = daddy.y;
            sliding[i] = 0;
            special[i] = 0;
        }
    }
    init = 1;
}
if (interpolate == true)
{
    interpolate = false;
    if (i_ex(daddy))
    {
        var xpos = daddy.x;
        var ypos = daddy.y;
        for (var i = 0; i < memory; i += 1)
        {
            remx[i] = x;
            remy[i] = y;
            facing[i] = 0;
        }
        remx[0] = xpos;
        remy[0] = ypos;
        for (var _iaia = targetdist; _iaia > 0; _iaia -= 1)
        {
            remx[_iaia] = lerp(xpos, x, _iaia / targetdist);
            remy[_iaia] = lerp(ypos, y, _iaia / targetdist);
        }
    }
}
if (!ignoredepth)
    scr_depth_alt(undefined, depthyoff);
nowx = x;
nowy = y;
moved = 0;
walk = 0;
runmove = 0;
slided = 0;
if (daddy.x != remx[0] || daddy.y != remy[0])
    moved = 1;
if (moved == 1 && follow == 1 && i_ex(daddy))
{
    for (var i = memory; i > 0; i--)
    {
        remx[i] = remx[i - 1];
        remy[i] = remy[i - 1];
    }
    remx[0] = daddy.x;
    remy[0] = daddy.y;
    x = remx[targetdist] - halign;
    y = remy[targetdist] - valign;
    if (abs(remx[targetdist + 1] - remx[targetdist]) > 4)
        runmove = 1;
    if (abs(remy[targetdist + 1] - remy[targetdist]) > 4)
        runmove = 1;
}
var walkanimspeed = 0.25;
var animdist = 1;
if (abs(point_distance(x, y, nowx, nowy)) > animdist)
{
    resetanim = 0;
    image_index += walkanimspeed;
    dir = point_direction(x, y, nowx, nowy) - 180;
    if (dir < 0)
        dir += 360;
    if (dir > 360)
        dir -= 360;
    facing = 0;
    if (dir >= 315 || dir <= 45)
        facing = 1;
    if (dir > 45 && dir < 135)
        facing = 2;
    if (dir >= 135 && dir <= 225)
        facing = 3;
}
else
{
    resetanim++;
    if (resetanim >= resetanimtarget)
        image_index = 0;
}
if (fun == 0)
{
    if (allowdown)
    {
        if (facing == 0)
            sprite_index = dsprite;
    }
    if (allowright)
    {
        if (facing == 1)
            sprite_index = rsprite;
    }
    if (allowup)
    {
        if (facing == 2)
            sprite_index = usprite;
    }
    if (allowleft)
    {
        if (facing == 3)
            sprite_index = lsprite;
    }
    if (!allowdown)
    {
        if (facing == 0)
        {
            if (sprite_index == usprite)
            {
                if (downfavor == "left")
                    sprite_index = lsprite;
                if (downfavor == "right")
                    sprite_index = rsprite;
                if (downfavor == "up")
                    sprite_index = usprite;
            }
        }
    }
    if (!allowup)
    {
        if (facing == 0)
        {
            if (sprite_index == dsprite)
            {
                if (upfavor == "left")
                    sprite_index = lsprite;
                if (upfavor == "right")
                    sprite_index = rsprite;
                if (upfavor == "down")
                    sprite_index = dsprite;
            }
        }
    }
    if (flip)
    {
        if (facing == 3)
        {
            sprite_index = rsprite;
            image_xscale = -2;
        }
    }
    if (facing == 1)
    {
        sprite_index = rsprite;
        image_xscale = 2;
    }
}
