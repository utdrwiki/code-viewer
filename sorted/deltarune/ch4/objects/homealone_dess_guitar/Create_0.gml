event_inherited();
can_interact = true;

trigger = function()
{
    can_interact = false;
    with (obj_homealone_dess_closet_controller)
        finish_sequence = true;
    alarm[10] = 1;
};
