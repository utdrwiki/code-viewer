with (obj_mike_catbasket)
{
    scr_doom(self, 60);
    act = 3;
}
with (obj_mike_grabcat)
{
    if (speed == 0)
        hspeed = 4;
    friction = -1;
    action = 4;
    wall_destroy = 1;
    image_blend = c_white;
    sprite_index = spr_mike_cat_walk;
}
with (obj_mike_controller)
    hand_type = 0;
