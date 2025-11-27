if (open_door)
{
    open_door = false;
    scr_lerpvar("door_xpos", door_base_xpos, door_slide_xpos, 5);
}
if (close_door)
{
    close_door = false;
    scr_lerpvar("door_xpos", door_slide_xpos, door_base_xpos, 5);
}
if (closet_fadein)
{
    closet_fadein = false;
    scr_lerpvar("door_alpha", 1, 0, 10);
    scr_lerpvar("shelf_alpha", 1, 0.5, 10);
    alarm[0] = 10;
}
if (closet_fadeout)
{
    closet_fadeout = false;
    scr_lerpvar("door_alpha", 0, 1, 10);
    scr_lerpvar("shelf_alpha", 0.5, 1, 10);
    alarm[1] = 10;
}
