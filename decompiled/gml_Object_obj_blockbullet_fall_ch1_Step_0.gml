if (con == 1)
{
    active = true
    visible = true
    image_alpha += 0.15
    if (image_alpha >= 1)
        con = 2
}
if (con == 2)
{
    falltimer += 1
    if (falltimer >= fallspeed)
    {
        if (ypos < 0 && (!(collision_point((x + (sprite_width / 2)), (y + (sprite_height * 1.5)), obj_blockbullet_fall_ch1, 0, 1))))
            ypos += 1
        else
            halt = true
        falltimer = 0
    }
}
if (con == 0)
    con = 1
if (con == 3)
{
    if (image_alpha <= 0.2)
        instance_destroy()
    active = false
    image_alpha -= 0.2
}
if instance_exists(obj_battlesolid_ch1)
{
    lx = ((obj_battlesolid_ch1.x - (obj_battlesolid_ch1.sprite_width / 2)) + 8)
    x = (lx + (xpos * sprite_width))
    yx = (((obj_battlesolid_ch1.y + (obj_battlesolid_ch1.sprite_height / 2)) - 3) - sprite_height)
    y = (yx + (ypos * sprite_height))
}
if (grazed == true)
{
    grazepoints = 0
    timepoints = 0
}
