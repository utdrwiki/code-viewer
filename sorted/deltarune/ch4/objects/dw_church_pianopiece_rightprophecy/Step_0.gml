scr_populatechars();
if (con == 0 && global.interact == 0)
{
    var trig = scr_trigcheck("prophecy");
    if (trig)
    {
        global.flag[886] = 1;
        global.interact = 1;
        prophecyactive = 1;
        con = 1.1;
    }
}
if (con == 1.01)
{
    timer++;
    if (timer == 15)
        prophecyactive = 1;
    if (timer == 30)
    {
        with (obj_mainchara)
            ignoredepth = 0;
        global.interact = 1;
        global.facing = 2;
        con = 1.1;
    }
}
if (con == 1.1)
{
    con = 2;
    with (instance_create(x, y, obj_ch4_DCA08A))
        con = 1;
}
if (con == 1 && !i_ex(obj_ch4_DCA08A))
{
    con = 2;
    proptrig = 1;
}
if (con == 2)
    proptrig = 1;
if (proptrig == 1)
{
    prophecyactive = 0;
    with (obj_trigger)
    {
        if (extflag == "prophecy")
        {
            if (place_meeting(x, y, obj_mainchara))
                other.prophecyactive = 1;
        }
    }
}
roomglow.active = prophecyactive;
prophecy.active = prophecyactive;
if (global.flag[886] == 0)
{
    if (prophecyactive)
        scr_setflag(886, 1);
}
