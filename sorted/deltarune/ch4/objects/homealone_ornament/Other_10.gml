if (fallen)
    exit;
if (interacting)
{
    global.interact = 1;
    confirm = x >= 627;
    if (collision_rectangle(x, y, x + sprite_width + 1, y + sprite_height, obj_homealone_solid, false, true))
    {
        confirm = 0;
        against_wall = true;
    }
    else
    {
        against_wall = false;
    }
    if (confirm == 1)
    {
        fallen = true;
        can_push = false;
        scr_lerpvar_instance(id, "image_angle", 0, -90, 5);
        scr_lerpvar_instance(id, "hspeed", 3, 0, 12);
        scr_lerpvar_instance(id, "vspeed", 3, 0, 8);
    }
    alarm[10] = 1;
}
