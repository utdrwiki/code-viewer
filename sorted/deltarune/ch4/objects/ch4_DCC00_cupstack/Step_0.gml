if (!init)
{
    minstack = 10;
    stack = 24;
    maxstack = 24;
    extended = true;
    stacksize = maxstack;
    init = 1;
}
var height = scr_even((y - (stacksize * count)) + 8 + 8);
if (con == 1)
{
    timer++;
    var jumptime = 8;
    var jumpheight = 16;
    var starttime = 10;
    if (timer == 1)
    {
        var targheight = maxstack;
        if (extended)
            targheight = minstack;
        var style = -2;
        if (extended)
            style = -1;
        var inout = "out";
        if (extended)
            inout = "in";
        scr_lerpvar("stacksize", stacksize, targheight, 40, style, inout);
    }
    if (timer == 60)
    {
        con = 10;
        timer = 0;
        sine_interval = 0;
        siner = 0;
    }
}
if (con == 10)
{
    var jumptime = 8;
    var jumpheight = 16;
    var starttime = 26;
    timer++;
    if (timer == 1)
    {
        var targheight = maxstack;
        if (extended)
        {
            stacksize = minstack;
        }
        else
        {
            stacksize = maxstack;
            targheight = minstack;
        }
        var inout = "in";
        if (extended)
            inout = "out";
        var style = -2;
        if (extended)
            style = -1;
        scr_lerpvar("stacksize", stacksize, targheight, 20, style, inout);
    }
    if (timer == 60)
    {
    }
}
