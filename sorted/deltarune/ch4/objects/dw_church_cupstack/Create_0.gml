count = 22;
timer = 0;
con = 0;
init = 0;
minstack = 8;
stack = 8;
stacksize = stack;
maxstack = 20;
image_speed = 0;
scr_darksize();
onboard = false;
scr_depth_alt();
extended = false;
roomtarg = room;
cupmarker = 0;
siner = 0;
mytrig = instance_create(x - 4, y, obj_trigger_interact);
scr_sizeexact(40, 40, mytrig);
mytrig.strict = true;
remalpha = -1;
if (i_ex(obj_dw_church_mizzleencounter))
{
    count = 14;
    with (mytrig)
    {
        strict = true;
        issolid = true;
    }
}
if (i_ex(obj_dw_church_bellhall_bookroom))
{
    with (mytrig)
    {
        setxy(1080, 240);
        scr_sizeexact(40, 80);
    }
}
if (i_ex(obj_dw_church_rightconnect))
{
    roomtarg = 223;
    if (global.plot < 185)
        instance_destroy();
}
if (i_ex(obj_dw_church_organpuzzle))
{
    y += 120;
    x -= 8;
    if (global.plot < 185)
    {
        instance_destroy();
    }
    else
    {
        roomtarg = 220;
        extended = true;
        with (mytrig)
        {
            setxy(80, 280);
            scr_sizeexact(40, 80);
        }
    }
}
if (global.interact == 7 && global.tempflag[93] == 1)
{
    con = 10;
    timer = 0;
    global.interact = 1;
}
sumarker = 0;
ramarker = 0;
sustayvis = false;
rastayvis = false;
krstayvis = false;
dofade = false;
