if (global.turntimer < 1)
{
    instance_destroy();
    exit;
}
event_inherited();
if (overpower)
{
    with (obj_bullet_homing)
    {
        if (point_distance(x, y, other.x, other.y) < (10 * other.overpower))
        {
            instance_destroy();
            with (instance_create(x, y, obj_regularbullet))
            {
                active = false;
                spin = 1;
                spinspeed = random(5) - 0.25;
                direction = 70 + random(40);
                speed = 1 + random(1);
                image_xscale = 0.5;
                image_yscale = 0.5;
                sprite_index = spr_cakesmoke;
                scr_lerpvar("image_alpha", 1, 0, 30);
                scr_script_delayed(instance_destroy, 30);
            }
        }
    }
}
if (slowdown == true)
{
    if (gotopointer == false)
    {
        friction = 0.1;
        gravity = 0;
        destroyonhit = false;
    }
    else if (i_ex(obj_rouxls_laser_pointer_controller))
    {
        friction = 0;
        var aa = randx + obj_rouxls_laser_pointer_controller._mouse_x;
        var bb = randy + obj_rouxls_laser_pointer_controller._mouse_y;
        var _dir = point_direction(x, y, aa, bb);
        var _diff = angle_difference(_dir, direction);
        direction += (_diff * 0.2);
        gravity_direction = direction;
        if (speed < 4)
            speed += 0.2;
        updateimageangle = true;
    }
}
if (i_ex(obj_growtangle) && y > (obj_growtangle.y + 75) && updateimageangle == false)
    instance_destroy();
