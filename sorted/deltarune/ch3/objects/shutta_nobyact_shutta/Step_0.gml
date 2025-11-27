if (con == 1)
{
    image_speed = 0;
    timer = 0;
    scr_lerpvar("image_xscale", image_xscale, 0, spintime, 3, "in");
    con = 2;
}
if (con == 2)
{
    timer++;
    if (timer > spintime)
    {
        facing = 1;
        scr_lerpvar("image_xscale", image_xscale, 2, spintime, 3, "out");
        con = 3;
        timer = 0;
    }
}
if (con == 3)
{
    timer++;
    if (timer >= waittime)
    {
        timer = 0;
        waittime = 20;
        spintime = 5;
        scr_lerpvar("image_xscale", image_xscale, 0, spintime, 3, "in");
        con = 4;
    }
}
if (con == 4)
{
    timer++;
    if (timer > spintime)
    {
        facingdelay = 3;
        obj_shutta_nobyacttest.startrotating = true;
        obj_shutta_photo_controller.disablemovement = false;
        scr_lerpvar("image_xscale", image_xscale, -2, spintime, 3, "out");
        con = 0;
        timer = 0;
    }
}
depth = (obj_shutta_photo_controller.depth + 1000) - 10 - y;
if (scr_debug())
{
    if (keyboard_check_pressed(vk_space))
    {
        if (con == 0)
            con = 1;
    }
}
facingdelay--;
if (facingdelay == 0)
    facing = 0;
