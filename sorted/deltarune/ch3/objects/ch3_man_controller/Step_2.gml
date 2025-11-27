var checkend = 0;
if (endcon == 0)
{
    with (obj_mainchara)
    {
        if (place_meeting(x, y, obj_triggervolume))
            checkend = 1;
    }
}
originX = layer_get_x(tileLayer);
originY = layer_get_y(tileLayer);
if (movestep == 0)
{
    if (obj_mainchara.x < 0)
        shift = "right";
    if (obj_mainchara.x > 612)
        shift = "left";
    if (obj_mainchara.y < 0)
        shift = "up";
    if (obj_mainchara.y > 406)
        shift = "down";
    if (shift != 0)
    {
        global.interact = 1;
        movestep = 1;
    }
}
if (movestep == 1)
{
    if (shift == "right")
    {
        movespeed = 32;
        if (moving != 640)
        {
            for (var i = 0; i < movealllength; i++)
            {
                with (moveall[i].object_index)
                    x += other.movespeed;
            }
            with (obj_mainchara)
                x += 30;
            layer_x(tileLayer, layer_get_x(tileLayer) + movespeed);
            moving += movespeed;
        }
        else
        {
            movestep = 999;
        }
    }
    if (shift == "left")
    {
        if (!checkend)
        {
            movespeed = 32;
            if (moving != 640)
            {
                for (var i = 0; i < movealllength; i++)
                {
                    with (moveall[i].object_index)
                        x -= other.movespeed;
                }
                with (obj_mainchara)
                    x -= 30;
                layer_x(tileLayer, layer_get_x(tileLayer) - movespeed);
                moving += movespeed;
            }
            else
            {
                movestep = 999;
            }
        }
        else
        {
            endcon = 1;
            movestep = 42069;
        }
    }
    if (shift == "up")
    {
        movespeed = 24;
        if (moving != 480)
        {
            moving += movespeed;
            for (var i = 0; i < movealllength; i++)
            {
                with (moveall[i].object_index)
                    y += other.movespeed;
            }
            with (obj_mainchara)
                y += 20;
            layer_y(tileLayer, layer_get_y(tileLayer) + movespeed);
        }
        else
        {
            movestep = 999;
        }
    }
    if (shift == "down")
    {
        movespeed = 24;
        if (moving != 480)
        {
            moving += movespeed;
            for (var i = 0; i < movealllength; i++)
            {
                with (moveall[i].object_index)
                    y -= other.movespeed;
            }
            with (obj_mainchara)
                y -= 20;
            layer_y(tileLayer, layer_get_y(tileLayer) - movespeed);
        }
        else
        {
            movestep = 999;
        }
    }
    if (shift == "warp")
    {
        global.interact = 1;
        movestep = 90;
        camtimer = 0;
    }
}
if (movestep == 90)
{
    camtimer++;
    if (camtimer == 15)
    {
        var moveX = -warpx - originX;
        var moveY = -warpy - originY;
        with (obj_mainchara)
            setxy(other.playerx + other.originX, other.playery + other.originY);
        with (obj_mainchara)
            setxy(x + moveX, y + moveY);
        for (var i = 0; i < movealllength; i++)
        {
            with (moveall[i].object_index)
                setxy(x + moveX, y + moveY);
        }
        layer_x(tileLayer, layer_get_x(tileLayer) + moveX);
        layer_y(tileLayer, layer_get_y(tileLayer) + moveY);
    }
    if (camtimer == 35)
        movestep = 999;
}
if (movestep == 999)
{
    global.interact = 0;
    movestep = 0;
    shift = 0;
    moving = 0;
}
if (endcon == 1)
{
    instance_create(x, y, obj_ch3_dw_man_scenetransition_persistent);
    global.interact = 1;
    endcon = 2;
}
