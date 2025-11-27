if (activated)
{
    if ((abs(x - obj_growtangle.x) > 125 || abs(y - obj_growtangle.y) > 125) && point_distance(x, y, obj_growtangle.x, obj_growtangle.y) > point_distance(xprevious, yprevious, obj_growtangle.x, obj_growtangle.y))
    {
        image_alpha = scr_approach(image_alpha, 0, 0.125);
        if (image_alpha == 0)
        {
            event_user(1);
            instance_destroy();
        }
    }
}
