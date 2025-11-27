if (instance_exists(obj_dbulletcontroller) && instance_exists(obj_growtangle))
{
    if (obj_dbulletcontroller.made)
    {
        var scale = 2 + (2 * (obj_dbulletcontroller.type == 156));
        obj_growtangle.visible = true;
        draw_sprite_ext(obj_growtangle.sprite_index, 1, obj_growtangle.x, obj_growtangle.y - (60 * (obj_dbulletcontroller.type == 156)), scale, scale, 0, c_black, fade);
        fade -= 0.025;
        if (fade <= 0)
            instance_destroy();
    }
}
