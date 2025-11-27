for (var a = 0; a < sameattack; a++)
{
    if (a == 0)
    {
        var temp_list = ds_list_create();
        ds_list_add(temp_list, 0, 1, 2, 3, 4, 5);
        ds_list_delete(temp_list, ds_list_find_index(temp_list, first_segment));
        if (sameattack)
            ds_list_delete(temp_list, ds_list_find_index(temp_list, second_segment));
        ds_list_shuffle(temp_list);
        segment = ds_list_find_value(temp_list, 0);
        ds_list_destroy(temp_list);
    }
    else
    {
        segment += (2 + irandom(2));
    }
    segment %= 6;
    if (a == 0)
        first_segment = segment;
    if (a == 1)
        second_segment = segment;
    var xpos = 0;
    var ypos = 0;
    if (difficulty > 0)
    {
        xpos = scr_get_box(4);
        ypos = scr_get_box(1) + 12.5 + (25 * segment);
    }
    else
    {
        xpos = scr_get_box(2) + 12.5 + (25 * segment);
        ypos = scr_get_box(5);
    }
    with (scr_fire_bullet(xpos, ypos, obj_organ_enemy_vertical_pillar, 0, 0, spr_organ_bar))
    {
        image_speed = 0;
        image_xscale = 0;
        image_yscale = 2;
        destroyonhit = false;
        active = false;
        image_blend = c_gray;
        parentid = other.creatorid;
        damage = 56;
        target = other.target;
        if (other.difficulty > 0)
        {
            green = 1;
            image_blend = c_lime;
            image_angle = 90;
        }
        if (other.difficulty == 2)
            chorus = 1;
        scr_lerpvar("image_xscale", 0, 0.4, 13, 3, "in");
        scr_script_delayed(scr_lerpvar, 13, "image_xscale", 0.4, 1.25, 3, -1, "out");
        if (a == 0)
            scr_script_delayed(snd_play, 13, 289, 1, 2);
        for (var c = 0; c < (6 + (other.pop * 2)); c++)
        {
            with (scr_fire_bullet(x, y, obj_bulletparent, 0, 0, spr_organ_bar))
            {
                active = false;
                im_a_bar = true;
                damage = 56;
                target = other.target;
                depth = other.depth + 1;
                if (other.chorus == 1)
                    image_blend = c_lime;
                else
                    image_blend = c_gray;
                image_speed = 0;
                image_alpha = 0.5;
                image_xscale = 0;
                image_yscale = 2;
                image_angle = other.image_angle;
                scr_script_delayed(scr_lerpvar, c * 3, "image_xscale", 0, 2, 8);
                scr_script_delayed(scr_lerpvar, c * 3, "image_alpha", 0.25, 0, 8, 5, "in");
            }
        }
        scr_script_delayed(scr_var, 16, "active", true);
        scr_script_delayed(scr_var, 16, "image_speed", 1);
        if (image_blend != c_lime)
            scr_script_delayed(scr_var, 16, "image_blend", 16777215);
        if (image_blend != c_lime)
            scr_script_delayed(scr_var, other.interval, "image_blend", 8421504);
        scr_script_delayed(scr_var, other.interval, "active", false);
        scr_script_delayed(scr_lerpvar, other.interval, "image_xscale", 1, 0, 4);
        if (image_blend != c_lime && other.onlybars)
        {
            var randoff = choose(12.5, 137.5);
            for (a = 0; a < 6; a++)
                scr_script_delayed(scr_fire_bullet, 16, x, (y - 75) + (((25 * a) + randoff) % 150), 1438, (a % 2) * 180, 0);
        }
        alarm[0] = other.interval + 4;
    }
}
alarm[0] = interval;
