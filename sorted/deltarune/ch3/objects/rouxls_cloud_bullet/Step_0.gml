if (con == 1)
{
    timer++;
    image_alpha += 0.05;
    if (timer == 20)
    {
        timer = 0;
        con = 2;
    }
}
if (con == 2)
{
    timer++;
    x = lerp(start_x, target_x, timer / 30);
    y = lerp(start_y, target_y, timer / 30);
    if (timer == 30)
    {
        timer = 0;
        con = 3;
        move_count++;
        start_x = x;
        start_y = y;
        if (move_count == 1)
        {
            target_x = x + 79;
            target_y = y;
        }
        if (move_count == 2)
        {
            target_x = x - 79;
            target_y = y;
        }
        if (move_count == 3)
        {
            target_x = x;
            target_y = y + 79;
        }
    }
}
if (con == 3)
{
    timer++;
    if (timer == 26)
    {
        timer = 0;
        con = 2;
    }
}
if (con == 4)
{
    timer++;
    if (i_ex(obj_rouxls_laser_pointer_controller))
    {
        var xx = real(obj_rouxls_laser_pointer_controller._mouse_x);
        var yy = real(obj_rouxls_laser_pointer_controller._mouse_y);
        if (point_distance(x, y, xx, yy) > 10)
        {
            move_towards_point(xx, yy, 2);
        }
        else
        {
            speed = 0;
            alarm[0] = 30;
        }
    }
    else
    {
        speed = 0;
    }
    if (alarm[0] > 0)
        speed = 0;
}
if (snowflakes == 0 && con > 1 && (timer % 15) == 0)
{
    with (scr_fire_bullet((x - 18) + irandom(36), y + 6 + random(6), obj_rouxls_suncloud_bullets, 270, 1 + random(2), spr_raindrop))
    {
        updateimageangle = 1;
        image_angle = 270;
        gravity_direction = 270;
        gravity = 0.14;
        image_xscale = 0.75;
        image_yscale = 0.75;
        if (i_ex(obj_rouxls_laser_pointer_controller))
        {
            var xx = real(obj_rouxls_laser_pointer_controller._mouse_x);
            var yy = real(obj_rouxls_laser_pointer_controller._mouse_y);
            gravity_direction = point_direction(x, y, xx, yy);
            direction = gravity_direction;
            image_angle = gravity_direction;
        }
    }
}
if (snowflakes == 1 && con > 1)
{
    if (cluster == true)
    {
        if ((timer % 8) == 0)
        {
            with (instance_create((x - 10) + random(20), (y - 10) + random(20), obj_rouxls_suncloud_bullets))
            {
                image_angle = random(360);
                spin = 1;
                spinspeed = (1 + random(2)) * choose(1, -1);
                sprite_index = spr_snowflake;
                image_blend = c_gray;
                active = false;
                direction = point_direction(x, y, (obj_growtangle.x - 60) + random(130), (obj_growtangle.y - 60) + random(130));
                speed = random(0.8);
                image_alpha = 0;
                scr_lerpvar("image_alpha", 0, 1, 5);
                scr_script_delayed(scr_var, 10, "active", true);
                scr_script_delayed(scr_var, 10, "image_blend", 16777215);
                scr_script_delayed(scr_var, 70, "active", false);
                scr_script_delayed(scr_var, 70, "image_blend", 8421504);
                scr_script_delayed(scr_lerpvar, 70, "image_alpha", 1, 0, 15);
                image_xscale = 2;
                image_yscale = 2;
            }
        }
    }
    else if ((timer % 15) == 0)
    {
        with (obj_regularbullet)
            direction = point_direction(x, y, other.x, other.y);
        with (instance_create((obj_growtangle.x - 80) + random(160), (obj_growtangle.y - 80) + random(160), obj_rouxls_suncloud_bullets))
        {
            image_angle = random(360);
            spin = 1;
            spinspeed = (1 + random(2)) * choose(1, -1);
            sprite_index = spr_snowflake;
            image_blend = c_gray;
            active = false;
            direction = point_direction(x, y, other.x, other.y);
            speed = 0.5 + random(1);
            image_alpha = 0;
            scr_lerpvar("image_alpha", 0, 1, 15);
            scr_script_delayed(scr_var, 30, "active", true);
            scr_script_delayed(scr_var, 30, "image_blend", 16777215);
            scr_script_delayed(scr_var, 150, "active", false);
            scr_script_delayed(scr_var, 150, "image_blend", 8421504);
            scr_script_delayed(scr_lerpvar, 150, "image_alpha", 1, 0, 15);
            image_xscale = 2;
            image_yscale = 2;
        }
    }
}
