if (init == 0)
{
    init = 1;
    mysolid[0] = instance_create(x, y, obj_board_solid);
    mysolid[0].image_xscale = 0.5;
    mysolid[0].image_yscale = 0.5;
    mysolid[0].image_blend = c_red;
    mysolid[0].image_alpha = 1;
    mysolid[0].depth = -1;
    mysolid[1] = instance_create(x + 16, y, obj_board_solid);
    mysolid[1].image_xscale = 0.5;
    mysolid[1].image_yscale = 0.5;
    mysolid[1].image_blend = c_blue;
    mysolid[1].image_alpha = 1;
    mysolid[1].depth = -1;
    mysolid[2] = instance_create(x, y + 16, obj_board_solid);
    mysolid[2].image_xscale = 0.5;
    mysolid[2].image_yscale = 0.5;
    mysolid[2].image_blend = c_green;
    mysolid[2].image_alpha = 1;
    mysolid[2].depth = -1;
    mysolid[3] = instance_create(x + 16, y + 16, obj_board_solid);
    mysolid[3].image_xscale = 0.5;
    mysolid[3].image_yscale = 0.5;
    mysolid[3].image_blend = c_yellow;
    mysolid[3].image_alpha = 1;
    mysolid[3].depth = -1;
}
if (active && init)
{
    for (var i = 0; i < 4; i++)
    {
        mysolid[i].visible = false;
        s_active[i] = true;
    }
    if (i_ex(obj_board_grayregion))
    {
        if (i_ex(collision_rectangle(x + 4, y + 4, x + 8, y + 8, obj_board_grayregion, false, true)))
        {
            mysolid[0].visible = false;
            s_active[0] = false;
        }
        if (i_ex(collision_rectangle(x + 4 + 16, y + 4, x + 8 + 16, y + 8, obj_board_grayregion, false, true)))
        {
            mysolid[1].visible = false;
            s_active[1] = false;
        }
        if (i_ex(collision_rectangle(x + 4, y + 4 + 16, x + 8, y + 8 + 16, obj_board_grayregion, false, true)))
        {
            mysolid[2].visible = false;
            s_active[2] = false;
        }
        if (i_ex(collision_rectangle(x + 4 + 16, y + 4 + 16, x + 8 + 16, y + 8 + 16, obj_board_grayregion, false, true)))
        {
            mysolid[3].visible = false;
            s_active[3] = false;
        }
    }
    if (s_active[0] == false)
    {
        mysolid[0].x = room_width;
        mysolid[0].y = room_height;
    }
    else
    {
        mysolid[0].x = x + 0;
        mysolid[0].y = y + 0;
    }
    if (s_active[1] == false)
    {
        mysolid[1].x = room_width;
        mysolid[1].y = room_height;
    }
    else
    {
        mysolid[1].x = x + 16;
        mysolid[1].y = y + 0;
    }
    if (s_active[2] == false)
    {
        mysolid[2].x = room_width;
        mysolid[2].y = room_height;
    }
    else
    {
        mysolid[2].x = x + 0;
        mysolid[2].y = y + 16;
    }
    if (s_active[3] == false)
    {
        mysolid[3].x = room_width;
        mysolid[3].y = room_height;
    }
    else
    {
        mysolid[3].x = x + 16;
        mysolid[3].y = y + 16;
    }
    scr_depth_board();
    if ((s_active[0] + s_active[1] + s_active[2] + s_active[3]) != 4)
        depth = 999999;
}
