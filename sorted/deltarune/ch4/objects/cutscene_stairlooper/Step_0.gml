var rightloop = 0;
var leftloop = 0;
if (loop)
{
    if (type == 0)
    {
        if (obj_mainchara.x >= xpoint && obj_mainchara.x <= (xpoint + abs(xgobackamount)) && enteredloop == 0)
        {
            enteredloop = 1;
            legend_finish = false;
            if (parallel_cutscene && cutscene_object != -4)
            {
                dialogue_finish = false;
                cutscene = instance_create(x, y, cutscene_object);
                cutscene.looper = id;
            }
        }
        if (enteredloop == 1)
        {
            if (obj_mainchara.x >= (xpoint + abs(xgobackamount)))
                rightloop = 1;
            if (obj_mainchara.x <= xpoint)
                leftloop = 1;
        }
    }
    if (type == 1)
    {
        if (obj_mainchara.y >= ypoint && obj_mainchara.y <= (ypoint + abs(ygobackamount)) && enteredloop == 0)
        {
            enteredloop = 1;
            legend_finish = false;
            if (parallel_cutscene && cutscene_object != -4)
            {
                dialogue_finish = false;
                cutscene = instance_create(x, y, cutscene_object);
                cutscene.looper = id;
            }
        }
        if (enteredloop == 1)
        {
            if (obj_mainchara.y >= (ypoint + abs(ygobackamount)))
                rightloop = 1;
            if (obj_mainchara.y <= ypoint)
                leftloop = 1;
        }
    }
    if (enteredloop == 1 && (rightloop || leftloop))
    {
        var xback = xgobackamount;
        var yback = ygobackamount;
        if (leftloop)
        {
            xback = -xback;
            yback = -yback;
        }
        obj_mainchara.x += xback;
        obj_mainchara.y += yback;
        with (obj_caterpillarchara)
        {
            x += xback;
            y += yback;
            for (i = 0; i < 75; i += 1)
            {
                remx[i] += xback;
                remy[i] += yback;
            }
        }
        with (obj_dw_church_legender)
        {
            xx += xback;
            yy += yback;
        }
    }
    if (enteredloop)
    {
        if (dialogue_finish && legend_finish)
        {
            loop = 0;
            preventmenu = 0;
        }
    }
}
if (preventmenu == 1)
{
    global.flag[7] = 1;
    with (obj_darkcontroller)
        threebuffer = 4;
}
if (global.flag[7] == 1)
{
    if (preventmenu == 0)
        global.flag[7] = 0;
}
