if (init == 0)
{
    mysolid = instance_create(x, y, obj_board_solid);
    mysolid.sprite_index = sprite_index;
    scr_darksize(mysolid);
    init = 1;
}
if (updatedepth)
    scr_depth_board();
if (con == 1)
{
    con = 2;
    snd_play(snd_board_bomb);
    safe_delete(mysolid);
    smoke = instance_create(x, y, obj_board_smokepuff);
    smoke.depth = depth + 5;
    updatedepth = false;
    gravity = -2;
    scr_doom(id, 120);
}
if (con > 1 && y < 0)
    instance_destroy();
if (i_ex(mysolid))
{
    mysolid.x = x;
    mysolid.y = y;
}
