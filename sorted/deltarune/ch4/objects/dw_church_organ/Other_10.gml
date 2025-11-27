if (engaged == false && buffer < 0)
{
    var diffroom = false;
    if (instance_exists(obj_dw_church_organpuzzle))
        diffroom = true;
    var roomoffset = 0;
    if (diffroom)
        roomoffset = 560;
    move_to_position(roomoffset);
    global.interact = true;
    buffer = 3;
}
