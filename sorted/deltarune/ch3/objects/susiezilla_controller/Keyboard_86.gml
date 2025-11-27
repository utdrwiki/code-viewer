if (!mansion)
{
    mansion = instance_create(320, 240, obj_susiezilla_mansion);
    with (mansion)
        scr_depth_alt();
}
else
{
    with (mansion)
        event_user(0);
}
