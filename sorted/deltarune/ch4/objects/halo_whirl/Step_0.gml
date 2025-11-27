switch (state)
{
    case "spinup":
        x = camerax() + x_start;
        spin_speed += 0.05;
        if (spin_speed > 0.2)
            image_alpha = clamp(image_alpha + 0.05, 0, 1);
        if (spin_speed >= 1.5)
        {
            image_alpha = 1;
            state = "move_to_end";
            move_across_time = 0;
        }
        break;
    case "move_to_end":
        move_across_time++;
        x = camerax() + ease_inout_sine(move_across_time, x_start, x_end - x_start, move_across_duration);
        if (move_across_time == move_across_duration)
        {
            state = "spindown";
            move_across_time = 0;
        }
        break;
    case "move_to_start":
        move_across_time++;
        x = camerax() + ease_inout_sine(move_across_time, x_end, x_start - x_end, move_across_duration);
        if (move_across_time == move_across_duration)
            state = "spindown";
        break;
    case "spindown":
        spin_speed -= 0.05;
        image_alpha -= 0.05;
        if (spin_speed <= 0)
        {
            spin_speed = 0;
            state = "done";
        }
        break;
    case "done":
        instance_destroy();
        break;
}
with (obj_heroparent)
    image_speed = clamp(other.spin_speed, 0, 1);
whirl_xoffset += (((clamp(other.spin_speed, 0, 1) * 0.5) + 0.5) / 40);
whirl_xoffset %= 1;
whirl_yoffset += 0.02;
whirl_yoffset %= 1;
