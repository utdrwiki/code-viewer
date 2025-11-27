if (!init)
{
    init = 1;
    var pos1 = scr_heromarker("gen", "p1");
    var pos2 = scr_heromarker("gen", "p2");
    var pos3 = scr_heromarker("gen", "p3");
    prophecy[0] = instance_create(pos1[0] + 150, pos1[1] + 90, obj_dw_church_prophecy);
    prophecy[1] = instance_create(pos2[0] + 150, pos2[1] + 90, obj_dw_church_prophecy);
    prophecy[2] = instance_create(pos3[0] + 150, pos3[1] + 90, obj_dw_church_prophecy);
    prophecy[2].notext = true;
    prophecy[0].extflag = "initial1";
    prophecy[1].extflag = "initial2";
    prophecy[2].extflag = "initial2";
    prophecy[0].fade_edges = true;
    prophecy[1].fade_edges = true;
    prophecy[2].fade_edges = true;
}
if (lightinit == 0)
{
    if (scr_checklocation(1049, 2220, 258, 40))
    {
        roomglow.active = true;
        roomglow.actind = 1;
        with (obj_dw_church_prophecy)
            image_alpha = 1.2;
        with (obj_light_area_mask)
            on_amount = 0.1;
        with (obj_mainchara)
            nudgey = -20;
    }
    var entrance2 = -4;
    with (obj_markerAny)
    {
        if (image_index == 2)
            entrance2 = id;
    }
    if (i_ex(entrance2))
    {
        if (point_distance(obj_mainchara.x, obj_mainchara.y, entrance2.x, entrance2.y) < 40)
        {
            with (obj_mainchara)
                nudgey = -20;
        }
    }
    lightinit = 1;
}
scr_populatechars();
var prophecyactive = 0;
var whichproph = -1;
with (obj_trigger)
{
    if (place_meeting(x, y, obj_mainchara))
    {
        prophecyactive = 1;
        if (extflag == "1")
            whichproph = 1;
        if (extflag == "2")
            whichproph = 2;
        if (extflag == "3")
            whichproph = 3;
    }
}
roomglow.active = prophecyactive;
with (obj_dw_church_prophecy)
    active = false;
if (whichproph == 1)
    prophecy[0].active = true;
if (whichproph == 2)
    prophecy[1].active = true;
if (whichproph == 3)
    prophecy[2].active = true;
