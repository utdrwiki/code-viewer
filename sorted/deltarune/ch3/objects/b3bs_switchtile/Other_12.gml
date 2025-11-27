image_index = !image_index;
var up = instance_place(x, y - 32, object_index);
if (i_ex(up))
{
    with (up)
    {
        image_index = !image_index;
        with (instance_create(x, y, obj_board_smokepuff))
            image_blend = #FFECBD;
    }
}
var down = instance_place(x, y + 32 + 2, object_index);
if (i_ex(down))
{
    with (down)
    {
        image_index = !image_index;
        with (instance_create(x, y, obj_board_smokepuff))
            image_blend = #FFECBD;
    }
}
var left = instance_place(x - 32, y, object_index);
if (i_ex(left))
{
    with (left)
    {
        image_index = !image_index;
        with (instance_create(x, y, obj_board_smokepuff))
            image_blend = #FFECBD;
    }
}
var right = instance_place(x + 32 + 2, y, object_index);
if (i_ex(right))
{
    with (right)
    {
        image_index = !image_index;
        with (instance_create(x, y, obj_board_smokepuff))
            image_blend = #FFECBD;
    }
}
with (obj_dw_b3bs_mysterypuzzle)
    update = true;
