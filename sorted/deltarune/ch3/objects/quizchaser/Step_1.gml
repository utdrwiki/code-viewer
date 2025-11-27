if (camerasettle == 0)
{
    if (obj_board_camera.con == 0)
        camerasettle = 1;
}
if (camerasettle == 1)
{
    if (obj_board_camera.shift != "none")
    {
        var fader = instance_create(x, y, obj_board_marker);
        fader.sprite_index = sprite_index;
        fader.image_index = image_index;
        fader.image_speed = 0;
        fader.image_xscale = image_xscale;
        if (facing == 0)
            fader.image_xscale = -2;
        fader.image_yscale = image_yscale;
        scr_doom(fader, 15);
        instance_destroy();
    }
}
