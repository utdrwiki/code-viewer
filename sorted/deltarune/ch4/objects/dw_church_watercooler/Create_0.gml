con = 0;
timer = 0;
siner = ((round(x + y) * 4) - 80) + round(current_second * 30);
howfull = 6 + scr_even(irandom(14));
scr_size(2, 2);
scr_depth();
type = 0;
mysolid = instance_create(x, y + 46, obj_solidblocksized);
drain = 1;
dodrain = false;
mizzle = scr_marker_ext(x, y, spr_holywater_idle, 2, 2, 0.125, undefined, undefined, undefined, undefined, undefined, 0);
mizzle.depth = 5000;
mizzle.con = 0;
mizzle.timer = 0;
mizzle.siner = 0;
mizzle.movespeed = 0;
mizzle.alerted = 0;
boss = 0;
if (id == instance_find(object_index, 2))
    boss = 1;
alertrad = 180;
patrolradius = 0;
encounterno = 153;
encounterflag = 1798;
if (room == room_dw_church_mizzleencounter || i_ex(obj_dw_church_mizzleencounter))
    encounterflag = 1798;
if (room == room_dw_church_rightconnect || i_ex(obj_dw_church_rightconnect))
    encounterflag = 1783;
doappear = 0;
haswater = 1;
dir = 0;
if ((round((x + y) / 100) % 3) == 0)
    dir = 1;
if (global.flag[encounterflag] == 1)
{
    haswater = 0;
    safe_delete(mizzle);
    con = 999;
    with (obj_dw_church_mizzleencounter)
    {
        safe_delete(bell);
        belltime = 999;
    }
}
init = 0;
