hittimer--;
if (missileCon >= 0)
{
    if (timer >= 5)
    {
        var missile = instance_create((x - 60) + ((missileCon % 5) * 30), y - 2, obj_susiezilla_missile);
        missile.height = 40;
        var _flip = (missileCon % 2) == 1;
        if (pattern == 2 || pattern == 5)
        {
            missile.target_y = target_y + random_range(-10, 10);
            missile.target_x = (camerax() + 320 + (dir * 260)) - (missileCon * 60 * dir);
        }
        else if (missileCon == tracker || pattern == 1)
        {
            missile.tracker = 1;
        }
        if (missileCon == missilecap)
            missileCon = -1;
        else
            missileCon++;
        if (pattern == 2 || pattern == 5)
            timer = 2;
        else
            timer = 0;
    }
    timer++;
}
if (pattern == 1)
{
    patterntimer++;
    if (patterncount < patterncountmax && (patterntimer % 4) == 0)
    {
        patterncount++;
        event_user(0);
    }
    if (patterntimer == 180)
    {
        patterncount = 0;
        patterncountmax += 2;
        patterntimer = 0;
        pattern = 5;
    }
}
if (pattern == 5)
{
    patterntimer++;
    if (patterntimer == 1)
        event_user(0);
    if (patterntimer == 61)
        event_user(0);
    if (patterntimer == 220)
    {
        patterntimer = 0;
        pattern = 1;
    }
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("N")))
    {
        pattern++;
        if (pattern == 6)
            pattern = 0;
        var _pname = "pattern";
        switch (pattern)
        {
            case 0:
                _pname = "random";
                break;
            case 1:
                _pname = "tracking";
                break;
            case 2:
                _pname = "linear";
                break;
            case 3:
                _pname = "reset salvo";
                break;
            case 4:
                _pname = "tracker salvo";
                break;
            case 5:
                _pname = "linear tracker";
                break;
        }
        scr_debug_print("missile pattern set to type " + string(pattern) + " (" + _pname + ")");
    }
}
