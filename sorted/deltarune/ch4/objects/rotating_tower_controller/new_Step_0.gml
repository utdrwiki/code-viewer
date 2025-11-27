if (i_ex(obj_climb_kris))
{
    krisx = camerax() + tower_x;
    krisy = obj_climb_kris.y + obj_climb_kris.drawoffsety;
    if (obj_climb_kris.onrotatingtower == true)
    {
        var adjustment = tower_x - tower_angle_fine_tune;
        var last_angle = tower_angle;
        tower_angle = lerp(0, 360, (obj_climb_kris.x - adjustment) / tower_circumference) - (tile_angle_difference / 2);
        tower_angle = (tower_angle + 360) % 360;
        if (abs(tower_angle - last_angle) > 100)
            tower_angle_add += (360 * sign(tower_angle - last_angle));
        tower_y = lerp(tower_ystart, tower_height, obj_climb_kris.y / tower_height);
    }
    if (destroy_climbstarter == true && i_ex(climbstarter_obj))
    {
        with (climbstarter_obj)
            instance_destroy();
    }
}
if (i_ex(obj_climb_kris))
{
    kristilex = (obj_climb_kris.x / tile_width_fine) + 1;
    kristiley = obj_climb_kris.y / tile_width_fine;
    if (kristiley > (verticaltilecount - 1))
        kristiley = verticaltilecount - 1;
    if (kristilex > horizontaltilecount)
        kristilex -= horizontaltilecount;
    if (kristilex < 0)
        kristilex += horizontaltilecount;
}
if (tile_sprite[xy(kristilex, kristiley)][1] == spr_climb_spike_2scale && checkdamagefloor)
{
    with (obj_climb_kris)
    {
        damage = 30;
        damagecon = 1;
    }
}
checkdamagefloor = 0;
if (i_ex(obj_rotating_bg_controller_new))
{
    if (i_ex(obj_climb_kris))
    {
        obj_rotating_bg_controller_new.tunnel_offset_x += ((obj_climb_kris.x - obj_climb_kris.xprevious) * 2);
        obj_rotating_bg_controller_new.tunnel_offset_y -= ((obj_climb_kris.y - obj_climb_kris.yprevious) * 0.4);
    }
    else if (i_ex(obj_mainchara))
    {
        obj_rotating_bg_controller_new.tunnel_offset_x += ((obj_mainchara.x - obj_mainchara.xprevious) * 0.2);
        obj_rotating_bg_controller_new.tunnel_offset_y -= ((obj_mainchara.y - obj_mainchara.yprevious) * 0.3);
    }
}
if (scr_debug() && keyboard_check_pressed(ord("V")))
    dodraw = !dodraw;
if (endclimb)
    endclimbtimer++;
if (tower_angle != tower_angle_prev2)
{
    tower_angle_prev2 = tower_angle;
    visible_indices = [];
    backface_indices = [];
    last_tile_angle = tile_angle[0] + tower_angle;
    if (last_tile_angle < 0)
        last_tile_angle += 360;
    else if (last_tile_angle > 360)
        last_tile_angle -= 360;
    for (i = 0; i < horizontaltilecount; i++)
    {
        var tile_angle1 = tile_angle[i] + tower_angle;
        if (tile_angle1 >= 360)
            tile_angle1 -= 360;
        else if (tile_angle1 < 0)
            tile_angle1 += 360;
        if (appearance < 2)
            tile_vis[i] = tile_angle1 > 350 || tile_angle1 <= 170;
        else
            tile_vis[i] = tile_angle1 >= 345 || tile_angle1 <= 165;
        if (appearance == 1 && tile_vis[i] == false && (tile_angle1 >= 340 || tile_angle1 <= 190))
            tile_vis[i] = 2;
        if (tile_vis[i] == false)
            continue;
        tile_x[i] = lengthdir_x(tower_radius, tile_angle1);
        var tile_angle2 = tile_angle1 + tile_angle_difference;
        if (tile_angle2 > 360)
            tile_angle2 -= 360;
        else if (tile_angle2 < 0)
            tile_angle2 += 360;
        tile_xscale[i] = lengthdir_x(tower_radius, tile_angle2) - tile_x[i];
        tile_color[i] = merge_color(c_white, tile_dark_color, col_blend * clamp(abs(tile_x[i] + (tile_xscale[i] * 0.5)) / 190, 0, 1));
        if (tile_vis[i] == 1)
            array_push(visible_indices, i);
        else if (tile_vis[i] == 2)
            array_push(backface_indices, i);
    }
}
if (appearance == 2 && tower_falls_apart_con == 1 && tower_falls_apart_i >= 0)
{
    var yoffset = (verticaltilecount * tile_height_fine) - (cameray() + cameraheight());
    var render_ypos = round(cameray() / tile_height_fine);
    var last = tower_falls_apart_timer;
    if (tower_falls_apart_i >= (fall_limit_min / 40))
    {
        if (abs(render_ypos - tower_falls_apart_i) > 3)
            tower_falls_apart_timer += (fall_speed * 4);
        else
            tower_falls_apart_timer += fall_speed;
    }
    if (last == 0 && tower_falls_apart_timer > last)
    {
        if (tower_falls_apart_i == 0)
        {
            tower_falls_apart_i = render_ypos + 8;
            layer_set_visible(layer_get_id("TILES"), 0);
            i = render_ypos + 13;
            while (i < 160)
            {
                for (ii = 0; ii < horizontaltilecount; ii++)
                    tile_sprite[xy(ii, i)][0] = spr_nothing;
                i++;
            }
        }
        else
        {
            tower_falls_apart_i--;
        }
        var deathY = (tile_height * (tower_falls_apart_i + 7)) + tower_ystart;
        for (var _i = 0; _i < horizontaltilecount; _i++)
        {
            if (tile_sprite[xy(_i, tower_falls_apart_i + 7)][0] != spr_nothing)
            {
                if ((tower_falls_apart_i + 7) < verticaltilecount)
                    tile_sprite[xy(_i, tower_falls_apart_i + 7)][0] = spr_nothing;
            }
        }
        with (obj_climb_climbable)
        {
            while ((y + (image_yscale * 40)) > deathY)
                image_yscale -= 1;
            if (y >= deathY)
                instance_destroy();
        }
        var rotating_piece = instance_nearest(0, 0, obj_tower_dog_fx1);
        var instances = [];
        deathY += 40;
        var aaa = ds_list_create();
        ds_list_add(aaa, 1, 6, 11, 16);
        ds_list_shuffle(aaa);
        var bottom = cameray() + cameraheight();
        while (rotating_piece.image_yscale > 0 && (rotating_piece.y + (rotating_piece.image_yscale * 40)) >= deathY)
        {
            rotating_piece.image_yscale -= 1;
            if ((rotating_piece.y + (rotating_piece.image_yscale * 40)) <= bottom)
            {
                for (var _i = 0; _i < 4; _i++)
                {
                    instances[_i] = instance_create_depth(rotating_piece.x, rotating_piece.y + (rotating_piece.image_yscale * 40), depth + 100, obj_tower_falling_piece);
                    if (_i == 0)
                        instances[_i].sprite_index = spr_tower_rotating_piece1_strip1;
                    if (_i == 1)
                        instances[_i].sprite_index = spr_tower_rotating_piece1_strip2;
                    if (_i == 2)
                        instances[_i].sprite_index = spr_tower_rotating_piece1_strip3;
                    if (_i == 3)
                        instances[_i].sprite_index = spr_tower_rotating_piece1_strip4;
                    instances[_i].image_index = rotating_piece.image_index;
                    instances[_i].delay = ds_list_find_value(aaa, _i);
                    instances[_i].depth = depth;
                }
            }
            if (rotating_piece.image_yscale <= 0)
            {
                instance_destroy(rotating_piece);
                fall_speed = 0;
                break;
            }
        }
        ds_list_destroy(aaa);
    }
    if (tower_falls_apart_i > 0 && obj_climb_kris.y >= ((tile_height * (tower_falls_apart_i + 7)) + tower_ystart) && obj_climb_kris.fallingtimer < 900)
    {
        obj_climb_kris.fallingcon = 1;
        obj_climb_kris.fallingtimer = 999;
        snd_play_pitch(snd_fall, 0.8);
        with (instance_create(0, 0, obj_tower_falling_kris_falls))
            con = 0.5;
    }
    if (tower_falls_apart_timer >= 65)
        tower_falls_apart_timer = 0;
    last = tower_falls_apart_timer_dog;
    if (tower_falls_apart_i_dog >= (fall_limit_min / 40))
    {
        if (abs(render_ypos - tower_falls_apart_i) <= 3 && fall_speed == fall_speed_dog)
            tower_falls_apart_timer_dog += fall_speed_dog;
        else
            tower_falls_apart_timer_dog += (fall_speed_dog * 4);
    }
    if (last == 0 && tower_falls_apart_timer_dog > last)
    {
        if (tower_falls_apart_i_dog == 0)
        {
            tower_falls_apart_i_dog = render_ypos + 6;
            with (obj_tower_dog_ladder_fake)
            {
                if (y >= (cameray() + cameraheight()))
                    instance_destroy();
            }
        }
        else
        {
            tower_falls_apart_i_dog--;
        }
        var deathY = (tile_height * (tower_falls_apart_i_dog + 8)) + tower_ystart;
        with (obj_tower_dog_ladder_fake)
        {
            if ((y + 40) >= deathY)
                instance_destroy(self);
        }
        var rotating_piece = instance_nearest(tower_x + 600, deathY, obj_tower_dog_fx1);
        var instances = [];
        var aaa = ds_list_create();
        ds_list_add(aaa, 1, 6, 11, 16);
        ds_list_shuffle(aaa);
        if (rotating_piece != -4 && rotating_piece.x >= (tower_x + 200))
        {
            var bottom = cameray() + cameraheight();
            while (rotating_piece.image_yscale > 0 && ((rotating_piece.image_yscale * 40) + rotating_piece.y) >= deathY)
            {
                rotating_piece.image_yscale -= 1;
                if ((rotating_piece.y + (rotating_piece.image_yscale * 40)) <= bottom)
                {
                    for (var _i = 0; _i < 4; _i++)
                    {
                        instances[_i] = instance_create_depth(rotating_piece.x, rotating_piece.y + (rotating_piece.image_yscale * 40), depth + 100, obj_tower_falling_piece);
                        if (_i == 0)
                            instances[_i].sprite_index = spr_tower_rotating_piece1_strip1;
                        if (_i == 1)
                            instances[_i].sprite_index = spr_tower_rotating_piece1_strip2;
                        if (_i == 2)
                            instances[_i].sprite_index = spr_tower_rotating_piece1_strip3;
                        if (_i == 3)
                            instances[_i].sprite_index = spr_tower_rotating_piece1_strip4;
                        instances[_i].image_index = rotating_piece.image_index;
                        instances[_i].delay = ds_list_find_value(aaa, _i);
                    }
                }
                if (rotating_piece.image_yscale <= 0)
                {
                    instance_destroy(rotating_piece);
                    fall_speed_dog = 0;
                    break;
                }
            }
            ds_list_destroy(aaa);
            if (i_ex(obj_tower_dog) && obj_tower_dog.fallingoff == false && obj_tower_dog.draw_y >= deathY)
            {
                with (obj_tower_dog)
                    fallingoff = true;
            }
        }
    }
    if (endclimb == false)
    {
        if (tower_falls_apart_timer_dog >= 65)
            tower_falls_apart_timer_dog = 0;
    }
}
