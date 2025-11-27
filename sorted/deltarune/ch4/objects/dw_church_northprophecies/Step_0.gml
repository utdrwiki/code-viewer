if (proptrig[0] == -4)
{
    with (obj_trigger)
    {
        if (extflag == "knight2")
            other.proptrig[0] = id;
    }
}
if (proptrig[1] == -4)
{
    with (obj_trigger)
    {
        if (extflag == "knight1")
            other.proptrig[1] = id;
    }
}
if (proptrig[2] == -4)
{
    with (obj_trigger)
    {
        if (extflag == "knight1temp")
        {
            other.proptrig[2] = id;
            extflag = "knight1";
        }
    }
}
if (!presparkle)
{
    presparkle = 1;
    if (global.flag[1529] == 1)
    {
        con = 2;
        safe_delete(prop1interact);
        safe_delete(proptrig[2]);
        safe_delete(prophecy[2]);
        var targdepth = 900290;
        scr_marker_ext(1480, 1534, spr_firework_shine, 2, 2, 0, 2.31, undefined, targdepth);
        scr_marker_ext(1338, 1536, spr_firework_shine, 2, 2, 0, 1.56, undefined, targdepth);
        scr_marker_ext(1480, 1528, spr_firework_shine, 2, 2, 0, 0.07, undefined, targdepth);
        scr_marker_ext(1536, 1526, spr_firework_shine, 2, 2, 0, 2.21, undefined, targdepth);
        scr_marker_ext(1388, 1526, spr_firework_shine, 2, 2, 0, 0.88, undefined, targdepth);
        scr_marker_ext(1344, 1526, spr_firework_shine, 2, 2, 0, 1.3, undefined, targdepth);
        scr_marker_ext(1402, 1524, spr_firework_shine, 2, 2, 0, 2.64, undefined, targdepth);
        scr_marker_ext(1404, 1526, spr_firework_shine, 2, 2, 0, 2.39, undefined, targdepth);
        scr_marker_ext(1496, 1526, spr_firework_shine, 2, 2, 0, 2.99, undefined, targdepth);
        scr_marker_ext(1486, 1526, spr_firework_shine, 2, 2, 0, 3.72, undefined, targdepth);
        scr_marker_ext(1416, 1532, spr_firework_shine, 2, 2, 0, 1.18, undefined, targdepth);
        scr_marker_ext(1506, 1524, spr_firework_shine, 2, 2, 0, 1.72, undefined, targdepth);
        scr_marker_ext(1376, 1528, spr_firework_shine, 2, 2, 0, 0.99, undefined, targdepth);
        scr_marker_ext(1332, 1524, spr_firework_shine, 2, 2, 0, 0.73, undefined, targdepth);
        scr_marker_ext(1370, 1538, spr_firework_shine, 2, 2, 0, 1.64, undefined, targdepth);
        scr_marker_ext(1532, 1528, spr_firework_shine, 2, 2, 0, 1.77, undefined, targdepth);
        scr_marker_ext(1356, 1538, spr_firework_shine, 2, 2, 0, 0.3, undefined, targdepth);
        scr_marker_ext(1384, 1530, spr_firework_shine, 2, 2, 0, 3.52, undefined, targdepth);
        scr_marker_ext(1532, 1532, spr_firework_shine, 2, 2, 0, 3.99, undefined, targdepth);
    }
}
var propactive = -1;
with (obj_trigger)
{
    if (extflag == "knight1" && place_meeting(x, y, obj_mainchara))
        propactive = 1;
    if (extflag == "knight2" && place_meeting(x, y, obj_mainchara))
        propactive = 2;
}
roomglow.active = propactive;
for (var i = 0; i < array_length(prophecy); i++)
{
    with (prophecy[i])
        active = false;
}
if (propactive == 1)
{
    with (prophecy[1])
        active = true;
    with (prophecy[2])
        active = true;
}
if (propactive == 2)
{
    with (prophecy[0])
        active = true;
}
if (con == 0)
{
    var trig = 0;
    with (prop1interact)
    {
        if (myinteract == 3)
            trig = 1;
    }
    if (trig == 1)
    {
        global.flag[1529] = 1;
        scr_doom(prop1interact, 30);
        safe_delete(proptrig[2]);
        prophecy[2].destroy = 1;
        con = 1;
    }
}
