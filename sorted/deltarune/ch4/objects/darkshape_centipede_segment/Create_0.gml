event_inherited();
grazed = 1;
grazepoints = 0;
shrink_sprite = spr_darkshape_directed;
autolight = false;
destroyonhit = false;
shakeme = false;
halfdrop = false;
segment_distance = 12;
blob_size = 0;
guide = -4;

chase_guide = function()
{
    if (guide == -4)
        exit;
    var to_x = guide.x + lengthdir_x(segment_distance, guide.direction + 180);
    var to_y = guide.y + lengthdir_y(segment_distance, guide.direction + 180);
    x = scr_approach(x, to_x, clamp(abs(x - to_x) * 0.2, 0.5, segment_distance));
    y = scr_approach(y, to_y, clamp(abs(y - to_y) * 0.2, 0.5, segment_distance));
    direction = point_direction(x, y, guide.x, guide.y);
};

fill_light = function()
{
    if (i_ex(obj_heart))
    {
        var hxx = obj_heart.x + 10;
        var hyy = obj_heart.y + 10;
        if (point_distance(x, y, hxx, hyy) < (obj_darkshape_light_aura.radius + 8) || autolight)
        {
            var light_ratio = 0.021 * (0.5 - light);
            light = scr_approach(light, 1, 0.021 + (autolight * 0.021) + light_ratio);
            if (!irandom(2))
            {
                with (instance_create_depth(x + random_range(-12, 12), y + random_range(-12, 12), depth + 2, obj_particle_generic))
                {
                    image_blend = c_white;
                    direction = point_direction(obj_heart.x + 10, obj_heart.y + 10, x, y);
                    speed = 1 + random(3);
                    shrink_rate = 0.15;
                }
            }
        }
        else
        {
            var light_ratio = 0.003 * (0.5 - light);
            light = scr_approach(light, 0, 0.003 + light_ratio);
        }
    }
};

check_death = function(arg0 = false)
{
    if (autolight)
        exit;
    if (light > 0.25 && !halfdrop)
    {
        halfdrop = true;
        var myindex = ds_list_find_index(master.segment_list, id);
        if (blob_size && myindex != -1 && (myindex % 2) == 0)
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
                prime_speed = 6 + irandom(2);
                size = 1;
                prime_me();
            }
            blob_size = scr_approach(blob_size, 0, 1);
        }
    }
    if (light == 1)
    {
        var _old = id;
        var _new = instance_create_depth(x, y, depth + 1, obj_darkshape_greenblob);
        _new.max_speed = obj_titan_enemy.snake_spd;
        _new.acc = obj_titan_enemy.snake_acc;
        _new.size = blob_size;
        if (i_ex(master))
        {
            var _index = ds_list_find_index(master.segment_list, _old);
            ds_list_replace(master.segment_list, _index, _new);
            if ((_index + 1) < ds_list_size(master.segment_list))
            {
                var guidee = ds_list_find_value(master.segment_list, _index + 1);
                guidee.guide = _new;
            }
        }
        if (arg0)
        {
            with (_new)
                prime_me();
        }
        else
        {
            with (_new)
                partially_prime();
        }
        instance_destroy();
    }
};
