if (obj_chefs_game.gameover)
    exit;
if (target == -4 && !other.leaving)
{
    target = other.id;
    alarm[1] = 1;
    speed = 0;
    x = other.x;
    y = other.bbox_top - 30;
    if (i_ex(obj_chefs_firewhip))
        y = other.bbox_top - 10;
    with (target)
    {
        sprite_index = sprEat;
        if (eating == 0)
            obj_chefs_game.customersfed++;
        eating = 1;
    }
}
if (obj_chefs_game.maxstack < stack_height)
{
    obj_chefs_game.maxstack = stack_height;
    debug_print("obj_chefs_game.maxstack=" + string(obj_chefs_game.maxstack));
}
