with (obj_mike_controller)
{
    sign_action2 = 1;
    if (sign_x2 == sign_x)
    {
        if (sign_x == (camerax() + (camerawidth() / 2)))
            sign_x2 = camerax() + (camerawidth() * choose(0.25, 0.75));
        else
            sign_x2 = camerax() + (camerawidth() / 2);
    }
}
for (i = 0; i < 20; i++)
{
    var ob = instance_create_depth(16 + camerax() + (i * 32), cameray() - 100, depth - 1, obj_mike_quiet);
    ob.type = 1;
}
