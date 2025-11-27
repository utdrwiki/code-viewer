if (obj_chefs_game.gameover)
{
    speed = 0;
    exit;
}
if (bbox_top >= (room_height + (stack_height * 30)))
    instance_destroy();
