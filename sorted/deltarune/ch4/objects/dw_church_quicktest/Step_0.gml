scr_populatechars();
if (!init)
{
    var pos = scr_heromarker(undefined, "prop3");
    prophecy3 = instance_create(pos[0] + 150, pos[1] + 90, obj_dw_church_prophecy);
    prophecy3.extflag = "gallery";
    prophecy3.alwaysactive = false;
    instance_create(0, 0, obj_roomglow);
    init = 1;
}
var act = scr_trigcheck("prop");
with (obj_dw_church_prophecy)
    active = act;
with (obj_roomglow)
    active = act;
