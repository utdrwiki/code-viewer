event_inherited();
grazed = 1;
grazepoints = 0;
shrink_sprite = spr_darkshape_directed_head;
with (obj_darkshape_manager)
    basic_shapes = false;
destroyonhit = false;
float_timer = 0;
individuality = irandom(100);
shakeme = false;
segment_distance = 12;
tracking_val *= 1.15;
blob_size = 0;
halfdrop = false;
guide = -4;
scalefactor = 1;
image_xscale = 1;
image_yscale = 1;
speedup = false;
segment_max = 3;
segment_length = 40;
myspeed = 0;
speed_remainder = 0;
segment_list = ds_list_create();
point_list = ds_list_create();
centipath = path_add();
path_set_kind(centipath, true);
path_set_closed(centipath, false);
ds_list_add(segment_list, id);

chase_centipede = function()
{
    var hxx = obj_heart.x + 10;
    var hyy = obj_heart.y + 10;
    float_timer += 1;
    var hx = hxx;
    var hy = hyy;
    path_clear_points(centipath);
    for (var a = 0; a < ds_list_size(point_list); a++)
    {
        var point_arr = ds_list_find_value(point_list, a);
        path_add_point(centipath, point_arr[0], point_arr[1], 1);
    }
    if (alarm[7])
        light = 1;
    if (!alarm[7])
    {
        for (var a = 0; a < ds_list_size(segment_list); a++)
        {
            var cur_segment = ds_list_find_value(segment_list, a);
            var cur_size = max(1, ds_list_size(segment_list) - 1);
            with (cur_segment)
            {
                var new_x = path_get_x(other.centipath, (1 / cur_size) * ds_list_find_index(other.segment_list, id));
                var new_y = path_get_y(other.centipath, (1 / cur_size) * ds_list_find_index(other.segment_list, id));
                x = new_x;
                y = new_y;
                if (object_index == obj_darkshape_centipede_segment)
                {
                    if (guide != -4)
                    {
                        direction = point_direction(x, y, guide.x, guide.y);
                        image_angle = direction;
                    }
                }
            }
        }
    }
    if (!alarm[7])
    {
        myspeed = 4.25 + (sin(timer * 0.1125) * 2.125);
        if (myspeed < 2.5)
        {
            speedup = false;
        }
        else if (!speedup)
        {
            snd_play(snd_screenshake_bc, 1.5, 0.35);
            with (obj_darkshape_centipede_head)
                speedup = true;
        }
    }
    if (!alarm[7])
    {
        if (i_ex(obj_heart))
        {
            if (point_distance(x, y, hxx, hyy) < (obj_darkshape_light_aura.radius + 8))
            {
                var light_ratio = 0.013 * (0.5 - light);
                light = scr_approach(light, 1, 0.013 + light_ratio);
                if (!irandom(2))
                {
                    with (instance_create_depth(x + random_range(-12, 12), y + random_range(-12, 12), depth + 2, obj_particle_generic))
                    {
                        image_blend = c_white;
                        direction = point_direction(obj_heart.x + 10, obj_heart.y + 10, x, y);
                        speed = 1 + random(3);
                        shrink_rate = 0.2;
                    }
                }
            }
            else
            {
                var light_ratio = 0.003 * (0.5 - light);
                light = scr_approach(light, 0, 0.003 + light_ratio);
            }
            var anglediff = angle_difference(direction, point_direction(x, y, hx, hy));
            direction -= clamp(sign(anglediff) * (tracking_val / (myspeed * 1.8)), -abs(anglediff), abs(anglediff));
            image_angle = direction;
        }
    }
};

check_death = function()
{
    if (alarm[7])
        exit;
    if (light > 0.25 && !halfdrop)
    {
        halfdrop = true;
        if (blob_size)
        {
            with (instance_create_depth(x, y, depth + 1, obj_bulletparent))
            {
                image_angle = 0;
                image_xscale = 0.0625;
                image_yscale = 0.0625;
                scr_lerpvar("image_xscale", image_xscale, image_xscale * 3, 4);
                scr_lerpvar("image_yscale", image_yscale, image_yscale * 3, 4);
                sprite_index = spr_finisher_explosion;
                image_index = 2;
                image_speed = 1;
                scr_script_delayed(instance_destroy, 5);
            }
            with (instance_create_depth(x, y, depth + 1, obj_darkshape_greenblob))
            {
                max_speed = 6 + irandom(2);
                size = 1;
                prime_me();
            }
            blob_size = scr_approach(blob_size, 0, 1);
        }
    }
    if (light == 1)
    {
        if (instance_number(obj_darkshape_centipede_head) == 1)
            global.turntimer = 70;
        else if (global.turntimer < 70)
            global.turntimer += 70;
        snd_play_pitch(snd_spearappear_choppy, 0.65);
        shakeme = true;
        myspeed *= 0;
        xscale *= 2;
        yscale *= 2;
        with (scr_afterimage_grow())
        {
            sprite_index = other.shrink_sprite;
            image_index = other.image;
            fade *= 2;
            xrate *= 0.5;
            yrate *= 0.5;
        }
        for (var b = 1; b < ds_list_size(segment_list); b++)
        {
            var cur_segment = ds_list_find_value(segment_list, b);
            cur_segment.shakeme = true;
            cur_segment.autolight = true;
            cur_segment.alarm[8] = b * 2;
            with (cur_segment)
                speed = point_distance(x, y, xprevious, yprevious) * 0;
        }
        alarm[7] = 20;
    }
};

ds_list_insert(point_list, 0, [x, y]);
