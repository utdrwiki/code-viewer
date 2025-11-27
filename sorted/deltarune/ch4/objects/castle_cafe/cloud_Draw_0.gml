if (fade == true)
{
    if (con == 0)
    {
        var widthtime = 40 + irandom(50);
        scr_lerpvar("width", width, 0, widthtime, choose(1, 2), "out");
        scr_lerpvar("height", width, 0, widthtime - irandom(10), choose(1, 2), "out");
        con = 1;
    }
    if (con == 1)
    {
        if (width < 1)
            instance_destroy();
        if (height < 1)
            instance_destroy();
    }
}
if (fade == false)
{
    if (con == 0)
    {
        timer++;
        width = basew + abs(sin(timer / bmodtw) * extw);
        height = baseh + abs(sin(timer / bmodth) * exth);
    }
}
