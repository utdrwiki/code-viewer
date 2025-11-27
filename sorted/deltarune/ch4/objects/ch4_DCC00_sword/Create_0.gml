is_init = false;
is_active = false;
sword_timer = 0;
destroyed = false;
target_y_pos = 0;
flip_side = false;

throw_sword = function(arg0)
{
    target_y_pos = arg0;
    is_active = true;
};
