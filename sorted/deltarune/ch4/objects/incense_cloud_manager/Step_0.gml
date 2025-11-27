if (global.turntimer < 1)
    instance_destroy();
timer++;
cloud_approach = scr_approach(cloud_approach, 0.25, 0.0025);
sin_power = 1 + (sin(timer * 0.05) * power_val);
cos_power = 1 - (sin(timer * 0.05) * power_val);
contraction = 1 + (sin(timer * 0.06) * 0.2);
with (obj_incense_cloud)
    image_alpha = scr_approach(image_alpha, 1, 0.05);
x = obj_growtangle.x + (sin(timer * 0.03) * 36 * movedir_1);
y = obj_growtangle.y + (sin(timer * 0.06) * 28 * movedir_2);
with (obj_incense_cloud)
{
    var ultimate_goal = (distance_goal * other.contraction) + (sin((other.timer * 0.1) + individual_value) * 4);
    distance = scr_approach(distance, ultimate_goal, abs(distance - ultimate_goal) * other.cloud_approach);
    current_angle += (ratio * other.turn_direction);
    image_angle = current_angle - 90;
    x = other.x + lengthdir_x(distance * other.sin_power, current_angle);
    y = other.y + lengthdir_y(distance * other.cos_power, current_angle);
    if (instance_number(obj_incense_cloud) < 3)
    {
        if (!irandom(127))
        {
            with (instance_create(x + irandom_range(-32, 32), y + irandom_range(-32, 32), obj_incense_sparkle))
            {
                direction = random(360);
                speed = 0.5 + random(1.5);
            }
        }
    }
}
