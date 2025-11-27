shoot_sequence = false;
shoot_sequence_timer = 0;
current_screen_tile = -4;
current_screen_sprite = 3996;
screen_alpha = 1;
screen_index = 0;
tvwidth = 0;
tvheight = 0;

init = function(arg0, arg1, arg2)
{
    current_screen_tile = arg0;
    tvwidth = arg2;
    tvheight = arg1;
    shoot_sequence = true;
};
