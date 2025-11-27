if (!i_ex(doorsolid))
{
    var door = scr_genmarker("doorsolid");
    doorsolid = instance_create(door.x, door.y, obj_solidblock);
    with (doorsolid)
        scr_sizeexact(door.sprite_width, door.sprite_height);
}
if (global.flag[1606] == 1)
{
    doorsolid.x = room_width * 2;
    layer_set_visible("HIDDEN_DOOR", 1);
    debug_message("hiddenDoorUnlocked");
}
