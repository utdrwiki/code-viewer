con = 0;
timer = 0;
block = instance_create(2368, 1504, obj_pushableblock_board);
block.reset = -1;
with (block)
    setxy_board();
resettile = instance_create(2368, 1568, obj_board_resettile);
with (resettile)
    setxy_board();
trig1 = instance_create(2632, 1480, obj_board_trigger);
with (trig1)
{
    setxy_board();
    extflag = "1";
    visible = false;
}
tree1 = instance_create(2656, 1472, obj_board_solid);
with (tree1)
{
    setxy_board();
    sprite_index = spr_board_tree;
    image_index = 0;
    image_speed = 0;
    visible = true;
    scr_darksize();
    depth = 999990;
}
tree2 = instance_create(2656, 1504, obj_board_solid);
with (tree2)
{
    setxy_board();
    sprite_index = spr_board_tree;
    image_index = 0;
    image_speed = 0;
    visible = true;
    scr_darksize();
    depth = 999990;
}
if (global.flag[1150] >= 2)
{
    safe_delete(tree1);
    safe_delete(tree2);
    safe_delete(block);
    safe_delete(resettile);
    safe_delete(trig1);
    with (obj_board_nothrow)
    {
        if (image_blend == #FF9999)
            instance_destroy();
    }
    with (obj_board_solidenemy)
    {
        if (image_blend == #FFFF75)
            instance_destroy();
    }
    con = 999;
}
