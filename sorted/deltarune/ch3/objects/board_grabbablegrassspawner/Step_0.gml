if (active)
{
    if (made == 0)
    {
        made = 1;
        if (type == "flower")
        {
            grass = instance_create(x, y, obj_board_flowers);
        }
        else
        {
            grass = instance_create(x, y, obj_board_grabbablegrass);
            grass.puzzleid = puzzleid;
            grass.type = type;
            grass.value = value;
            grass.potsprite = potsprite;
            grass.infinite = infinite;
        }
    }
}
else if (made)
{
    safe_delete(grass);
    made = 0;
}
