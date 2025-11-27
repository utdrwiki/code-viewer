timer = 0;
is_active = true;

fade_out = function()
{
    is_active = false;
    with (obj_titan_climb_darkness)
        fade_out();
};
