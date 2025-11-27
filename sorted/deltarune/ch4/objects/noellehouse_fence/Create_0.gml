depth = 980000;
is_closed = true;
open_fence = false;
close_fence = false;
hide_fence = false;
fence_left = scr_marker(x, y, bg_noellefence_left);
fence_left.depth = 9700;
fence_left_sprite = 4459;
fence_left_ypos = y;
fence_right_sprite = 1854;
fence_right_xpos = x;
fence_right_ypos = y;
test_timer = 0;
slope_collider = -4;
leaf_counter = 0;
if (global.chapter == 4 && global.plot == 45)
{
    is_closed = false;
    with (obj_readable_room1)
    {
        if (x < 210)
            instance_destroy();
    }
    with (obj_sul)
    {
        if (x < 220)
            instance_destroy();
    }
    slope_collider = instance_create(230, 120, obj_sul);
    slope_collider.image_yscale = 2;
    fence_left.x = x - 30;
    fence_left.y = y + 40;
    fence_right_xpos = x + 30;
    fence_right_ypos = y - 30;
}
