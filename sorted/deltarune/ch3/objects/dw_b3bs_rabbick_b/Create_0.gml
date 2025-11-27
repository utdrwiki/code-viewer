trigger = 0;
trigcount = 0;
triggerer = -1;
timer = 0;
ribbick = -1;
doorblocker = instance_create(280, 160, obj_solidblocksized);
doorblocker.image_xscale = 2;
door = 0;
doorcon = 0;
trigcount = global.flag[1105];
if (trigcount >= 1)
{
    for (var i = 0; i < trigcount; i++)
    {
        var trash = instance_find(obj_dw_ch3_b3bs_trashcan_interactor, irandom(instance_number(obj_dw_ch3_b3bs_trashcan_interactor) - 1));
        var newtrash = instance_create(trash.x, trash.y, obj_dw_ch3_b3bs_trashcan);
        newtrash.itemflag = 1105;
        newtrash.flag = false;
        newtrash.image_index = 1;
        safe_delete(trash);
    }
}
if (trigcount >= 2)
{
    door = scr_dark_marker(258, 46, spr_dw_ch3_b3bs_door);
    door.depth = 1000050;
    safe_delete(doorblocker);
}
