px = 0;
py = 0;
wspeed = 0;
siner += (0.09 * sine_speed);
move_amount_x = 1;
move_amount_y = 1;
var airflow_area = collision_rectangle(x, y - 5, x + sprite_width, y + sprite_height + 15, obj_homealone_vent_airflow, false, true);
if (airflow_area != -4)
{
    if (airflow_area.image_index == 0)
    {
        move_right = true;
        var bottom_area = collision_rectangle(x - 6, y + sprite_height, x + sprite_width, y + sprite_height + 4, obj_homealone_vent_airflow, false, true);
        if (bottom_area != -4 && bottom_area.image_index == 2)
        {
            py -= 1;
            siner = 0;
        }
        else
        {
            px += 4;
            py -= (sin(siner) * 0.2);
        }
    }
    if (airflow_area.image_index == 1)
    {
        var top_area = collision_rectangle(x, y - 2, x + sprite_width, y + 2, obj_homealone_vent_airflow, false, true);
        if (top_area != -4 && top_area.image_index == 3)
            py += 1;
        else
            px -= 4;
        py += (sin(siner) * 0.2);
        move_right = false;
    }
    if (airflow_area.image_index == 2)
        py -= 4;
    if (airflow_area.image_index == 3)
    {
        var left_area = collision_rectangle(x - 4, y, x + sprite_width, y, obj_homealone_vent_airflow, false, true);
        if (left_area != -4 && left_area.image_index == 0)
            px += 4;
        py += 4;
    }
}
if (airflow_area == -4)
{
    if (move_right)
        py += 1;
    else
        py -= 1;
}
x += (px * speed_multipler);
y += (py * speed_multipler);
