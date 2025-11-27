var played = false;
repeat (simulnotes)
{
    if (ds_list_size(bullet_list))
    {
        var cur_note = ds_list_find_value(bullet_list, 0);
        with (cur_note)
        {
            shway_counter = choose(0, 10 * pi);
            active = true;
            direction = scr_at_player(x, y);
            scr_lerpvar("speed", -5, 0, 10, 0, "in");
            if (other.sameattacker == 0)
                scr_var_delayed("direction", 270 + irandom_range(-5, 5), 12);
            else
                scr_var_delayed("direction", 90 + irandom_range(-5, 5), 12);
            scr_script_delayed(scr_afterimage_grow, 12);
            if (other.sameattacker == 0 && played < 2)
                played++;
            if (image_index == 0)
            {
                scr_script_delayed(scr_var, 12, "speed", 4);
                scr_script_delayed(scr_script_repeat, 12, scr_bullet_shway, 240, 1);
            }
            if (image_index == 1)
            {
                scr_script_delayed(scr_script_repeat, 12, scr_bullet_shway, 240, 1);
                scr_script_delayed(scr_var, 12, "speed", 5);
            }
            if (image_index == 2)
            {
                scr_script_delayed(scr_script_repeat, 12, scr_bullet_shway, 240, 1);
                scr_script_delayed(scr_var, 12, "speed", 3.75);
            }
        }
        ds_list_delete(bullet_list, 0);
    }
}
if (ds_list_size(bullet_list))
{
    alarm[2] = interval;
}
else
{
    alarm[1] = 1;
    bullet_counter = 0;
    repeating = true;
    ds_list_clear(origin_list);
    if (sameattack == 1)
    {
        ds_list_add(origin_list, 0, 0, 0, 1, 1, 1, 2, 2, 2);
        ds_list_add(origin_list, irandom(2));
    }
    else
    {
        ds_list_add(origin_list, 0, 0, 1, 1, 2, 2);
    }
    ds_list_shuffle(origin_list);
    ds_list_clear(gap_list);
    ds_list_add(gap_list, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
    ds_list_shuffle(gap_list);
    if (sameattack == 2)
    {
        repeat (4)
            ds_list_delete(gap_list, 0);
    }
    ds_list_sort(gap_list, true);
}
