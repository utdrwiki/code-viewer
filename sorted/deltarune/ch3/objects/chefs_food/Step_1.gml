if (i_ex(obj_tenna_minigame_ui) && y < (cameray() + 0))
    depth = obj_tenna_minigame_ui.depth - 1;
if (!on_fire)
    hspeed = clamp_gradual(hspeed, 0, 0, 1);
if (obj_chefs_game.gameover)
{
    speed = 0;
    exit;
}
if (thrown)
{
    if (fixate > 0 && instance_exists(fixate))
    {
        y = fixate.y + fixate_y;
        x = fixate.x;
    }
}
if (y >= floor_y && (!thrown || on_fire || falling))
{
    y = floor_y;
    obj_chefs_game.foodwasted++;
    instance_destroy();
    exit;
}
if (y > (room_height + 30) && thrown)
{
    obj_chefs_game.foodwasted++;
    instance_destroy();
}
if (caught)
    exit;
if (!falling && y < -16)
{
    falling = true;
    vspeed = fallspeed;
    x = 320 + (irandom(112) * choose(-1, 1));
    y = -16;
    instance_create_depth(x, 16, -10, obj_chefs_foodnotice);
}
if (falling)
{
    fallspeed = 3 + (1 * ((90 - obj_chefs_game.timer) / 60));
    vspeed = fallspeed;
}
