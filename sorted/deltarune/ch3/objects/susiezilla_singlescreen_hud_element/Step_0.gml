with (obj_susiezilla_gamecontroller)
{
    if (gameover == true)
    {
        var sourcedude = other.id;
        other.speed = 0;
        other.image_speed = 0;
        with (obj_script_delayed)
        {
            if (target == sourcedude)
                instance_destroy();
        }
        with (obj_lerpvar)
        {
            if (target == sourcedude)
                instance_destroy();
        }
    }
}
