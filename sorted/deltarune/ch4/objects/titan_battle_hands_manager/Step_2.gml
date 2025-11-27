with (hand_1)
{
    with (obj_collidebullet)
    {
        if (variable_instance_exists(id, "parent_id"))
        {
            if (place_meeting(x, y, other.id) && parent_id != other.id)
                instance_destroy();
        }
    }
}
with (hand_2)
{
    with (obj_collidebullet)
    {
        if (variable_instance_exists(id, "parent_id"))
        {
            if (place_meeting(x, y, other.id) && parent_id != other.id)
                instance_destroy();
        }
    }
}
timer++;
counter += counter_speed;
angle_counter += angle_counter_speed;
hand_direction = cos(angle_counter) * 4;
var chand_x = scr_get_box(4);
var chand_y = (scr_get_box(5) + (sin(counter) * 40)) - 20;
with (hand_1)
{
    if (fingers_broken < 4)
    {
        var xshake = 0;
        var yshake = 0;
        if (other.alarm[2] > 0)
        {
            xshake = choose(-2, 0, 2);
            yshake = choose(-2, 0, 2);
        }
        x = chand_x + lengthdir_x(other.hand_distance, other.hand_direction);
        y = chand_y + lengthdir_y(other.hand_distance, other.hand_direction);
        image_angle = point_direction(x, y, chand_x, chand_y);
        x += lengthdir_x(sin(other.wave_counter) * 20, other.hand_direction + 90);
        y += lengthdir_y(sin(other.wave_counter) * 20, other.hand_direction + 90);
        x += xshake;
        y += yshake;
        if (i_ex(finger_1))
        {
            with (finger_1)
            {
                with (obj_titan_battle_hands_manager)
                    finger_vector(other.id, other.master, -52, 68);
                image_angle = other.image_angle;
            }
        }
        else if ((other.alarm[0] || other.alarm[4]) && (other.timer % (40 + (other.difficulty * 2))) == 0)
        {
            other.wibbly_bullets(id, -52, 68);
        }
        if (i_ex(finger_2))
        {
            with (finger_2)
            {
                with (obj_titan_battle_hands_manager)
                    finger_vector(other.id, other.master, -2, 72);
                image_angle = other.image_angle;
            }
        }
        else if ((other.alarm[0] || other.alarm[4]) && ((other.timer + 10) % (40 + (other.difficulty * 2))) == 0)
        {
            other.wibbly_bullets(id, 0, 72);
        }
        if (i_ex(finger_3))
        {
            with (finger_3)
            {
                with (obj_titan_battle_hands_manager)
                    finger_vector(other.id, other.master, 51, 68);
                image_angle = other.image_angle;
            }
        }
        else if ((other.alarm[0] || other.alarm[4]) && ((other.timer + 20) % (40 + (other.difficulty * 2))) == 0)
        {
            other.wibbly_bullets(id, 51, 68);
        }
        if (i_ex(finger_4))
        {
            with (finger_4)
            {
                with (obj_titan_battle_hands_manager)
                    finger_vector(other.id, other.master, 103, 53);
                image_angle = other.image_angle;
            }
        }
        else if ((other.alarm[0] || other.alarm[4]) && ((other.timer + 30) % (40 + (other.difficulty * 2))) == 0)
        {
            other.wibbly_bullets(id, 103, 53);
        }
        if (other.alarm[3] > 10 && (global.time % 3) == 0)
        {
            with (scr_afterimagefast())
                depth = obj_growtangle.depth - 2;
        }
    }
}
with (hand_2)
{
    if (fingers_broken < 4)
    {
        var xshake = 0;
        var yshake = 0;
        if (other.alarm[2] > 0)
        {
            xshake = choose(-2, 0, 2);
            yshake = choose(-2, 0, 2);
        }
        x = chand_x + lengthdir_x(other.hand_distance, other.hand_direction + 180);
        y = chand_y + lengthdir_y(other.hand_distance, other.hand_direction + 180);
        image_angle = point_direction(x, y, chand_x, chand_y);
        x += lengthdir_x(sin(other.wave_counter) * 20, other.hand_direction + 270);
        y += lengthdir_y(sin(other.wave_counter) * 20, other.hand_direction + 270);
        x += xshake;
        y += yshake;
        if (i_ex(finger_1))
        {
            with (finger_1)
            {
                with (obj_titan_battle_hands_manager)
                    finger_vector(other.id, other.master, -103, 53);
                image_angle = other.image_angle;
            }
        }
        else if ((other.alarm[0] || other.alarm[4]) && (other.timer % (40 + (other.difficulty * 2))) == 0)
        {
            other.wibbly_bullets2(id, -103, 53);
        }
        if (i_ex(finger_2))
        {
            with (finger_2)
            {
                with (obj_titan_battle_hands_manager)
                    finger_vector(other.id, other.master, -51, 68);
                image_angle = other.image_angle;
            }
        }
        else if ((other.alarm[0] || other.alarm[4]) && ((other.timer + 10) % (40 + (other.difficulty * 2))) == 0)
        {
            other.wibbly_bullets2(id, -51, 68);
        }
        if (i_ex(finger_3))
        {
            with (finger_3)
            {
                with (obj_titan_battle_hands_manager)
                    finger_vector(other.id, other.master, 2, 72);
                image_angle = other.image_angle;
            }
        }
        else if ((other.alarm[0] || other.alarm[4]) && ((other.timer + 20) % (40 + (other.difficulty * 2))) == 0)
        {
            other.wibbly_bullets2(id, 0, 72);
        }
        if (i_ex(finger_4))
        {
            with (finger_4)
            {
                with (obj_titan_battle_hands_manager)
                    finger_vector(other.id, other.master, 52, 68);
                image_angle = other.image_angle;
            }
        }
        else if ((other.alarm[0] || other.alarm[4]) && ((other.timer + 30) % (40 + (other.difficulty * 2))) == 0)
        {
            other.wibbly_bullets2(id, 52, 68);
        }
        if (other.alarm[3] > 10 && (global.time % 3) == 0)
        {
            with (scr_afterimagefast())
                depth = obj_growtangle.depth - 2;
        }
    }
}
