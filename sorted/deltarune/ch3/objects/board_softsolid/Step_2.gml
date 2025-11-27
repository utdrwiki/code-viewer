var met = instance_place(x, y, obj_mainchara_board);
if (i_ex(met))
{
    if (pushdir == 0)
        met.y = (bbox_bottom + 2) - 16;
    if (pushdir == 1)
        met.x = bbox_right + 2;
    if (pushdir == 2)
        met.y = bbox_top - 2;
    if (pushdir == 3)
        met.x = bbox_left - 2 - 32;
}
