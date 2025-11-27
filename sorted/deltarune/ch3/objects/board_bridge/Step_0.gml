if (init == 0)
{
    xstart = x;
    ystart = y;
    if (size == 2)
        sprite_index = spr_board_bridge_2x;
    if (obj_board_camera.con == 0)
    {
        var cloud = instance_create(x, y, obj_board_smokepuff);
        cloud.image_blend = #B46A37;
        if (size == 2)
        {
            cloud = instance_create(x + 32, y, obj_board_smokepuff);
            cloud.image_blend = #B46A37;
        }
    }
    visible = true;
    init = 1;
}
if (place_meeting(x, y, obj_board_watertile))
{
    bridge = instance_create(x, y, obj_board_bridge_placed);
    bridge.puzzleid = puzzleid;
    bridge.sprite_index = sprite_index;
    bridge.image_speed = 0;
    bridge.image_index = 1;
    bridge.depth = depth - 1;
    scr_darksize(bridge);
    myboatsolid = instance_create(x, y, obj_board_boatsolid);
    myboatsolid.sprite_index = sprite_index;
    scr_darksize(myboatsolid);
    setxy(room_width, room_height);
}
if (i_ex(obj_board_swordhitbox))
{
    if (place_meeting(x, y, obj_board_swordhitbox))
    {
        instance_create(centerx(), centery(), obj_board_enemydefeatsplash);
        if (i_ex(daddy))
            safe_delete(daddy);
        instance_destroy();
    }
}
