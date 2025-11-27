if (sprite_exists(global.screenshot))
{
    sprite_delete(global.screenshot);
    debug_message("!! Cleaned up global.screenshot !!");
}
