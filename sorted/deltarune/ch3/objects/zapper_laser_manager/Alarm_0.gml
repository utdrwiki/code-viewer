if (segment == segment_max)
{
    choice = ds_list_create();
    if ((y + 22) > top)
        ds_list_add(choice, -1);
    if ((y + 22) < bound)
        ds_list_add(choice, 1);
    ds_list_shuffle(choice);
    direct = ds_list_find_value(choice, 0);
    ds_list_destroy(choice);
    var inter;
    if (direct == 1)
        inter = bound;
    else
        inter = top;
    if (i_ex(obj_heart))
    {
        diff = inter - (obj_heart.y + 10);
        reflect_angle = point_direction(x + 68, y + 22, obj_heart.x + 10, inter + diff);
    }
    var force_aim = 0;
    if (i_ex(obj_zapper_laser_linedraw))
        force_aim = obj_zapper_laser_linedraw.force_aim_counter;
    aim_true = false;
    if (!(random(99) < (force_aim * 25)) && abs(180 - reflect_angle) < 65)
    {
        if (!irandom(3))
            reflect_angle += irandom_range(-8, 8);
        var intersection = scr_lines_intersect(x + 68, y + 22, x + 68 + lengthdir_x(480, reflect_angle), y + 22 + lengthdir_y(480, reflect_angle), obj_growtangle.x - 165, inter, obj_growtangle.x + 165, inter, true);
        if (intersection <= 0 || intersection > 1)
        {
            if (direct == 1)
                inter = top;
            else
                inter = bound;
            if (i_ex(obj_heart))
            {
                diff = inter - (obj_heart.y + 10);
                reflect_angle = point_direction(x + 68, y + 22, obj_heart.x + 10, inter + diff);
            }
        }
        if (abs(180 - reflect_angle) < 65)
        {
            with (obj_zapper_laser_linedraw)
                force_aim_counter++;
        }
        else
        {
            aim_true = true;
        }
    }
    else
    {
        aim_true = true;
    }
    if (aim_true)
    {
        reflect_angle = scr_at_player(x + 68, y + 22);
        with (obj_zapper_laser_linedraw)
            force_aim_counter = 0;
        if (irandom(2))
        {
            var imprecision = random_range(-22.5, 22.5);
            for (angl = 3; angl > 0; angl--)
            {
                var imprecision_offset = imprecision * (angl / 3);
                var imprecise_angle = reflect_angle + imprecision_offset;
                if (collision_line(x + 68, y + 22, x + 68 + lengthdir_x(480, imprecise_angle), y + 22 + lengthdir_y(480, imprecise_angle), obj_growtangle, false, true))
                {
                    if (abs(180 - imprecise_angle) > 65)
                    {
                    }
                    else
                    {
                        reflect_angle = imprecise_angle;
                        break;
                    }
                }
            }
        }
    }
    if (nuisance)
        reflect_angle = clamp(reflect_angle, 125, 235);
    snd_play_x(snd_heartshot_dr_b, 1.4, 0.5);
}
with (scr_fire_bullet(x + 68, y + 22, obj_bullet_zapper_laser, reflect_angle, 11 - (1 * nuisance * sameattack) - (1 * sameattack), spr_zapper_laser))
{
    damage = other.damage;
    target = other.target;
    depth = (depth - 4) + other.creator;
    image_angle = direction;
    image_yscale_goal = other.scale_goal;
    if (other.segment == other.segment_max)
        first = true;
    if ((other.segment % 2) == 0 && other.segment > 3)
        do_bounce_image = true;
    if (i_ex(obj_volumeup))
    {
        image_yscale *= 1.5;
        image_yscale_goal *= 1.5;
        grazepoints += 1;
        if (i_ex(obj_tenna_board4_enemy))
            grazepoints += 2;
    }
    if (i_ex(obj_tenna_board4_enemy))
        grazepoints += 1;
}
segment--;
if (segment < 5)
    scale_goal -= 0.2;
if (segment)
{
    alarm[0] = 1;
}
else if (global.turntimer > (12 + segment_max + ((2 + (10 * sameattack) + (nuisance * 6)) * 2)))
{
    alarm[0] = 2 + (10 * sameattack) + (nuisance * 12);
    segment = segment_max;
    scale_goal = 1;
}
