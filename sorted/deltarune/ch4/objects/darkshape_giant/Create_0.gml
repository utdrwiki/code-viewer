event_inherited();
target = 4;
damage = 120;
canbepushed = false;
shrink_sprite = spr_darkshape_giant;
deathrattle = -1;
phase = "spawn";
light_rate = 0.0075;
light_recover = 0.0025;
light_treshold = 0;
light_damage = 0;
image_alpha = 0.5;
image_s = 0.5;
image_d = 0;
image_max = 2;
image_min = 0;
death_dir = 0;
destroyonhit = false;
big_shrink = 1;
speed_max = 1.25;
pushback_radius = 40;
x_goal = x;
y_goal = y;
box_distance = 300;
scr_lerpvar("box_distance", 300, 100, 30, 2, "out");
if (irandom(1))
{
    box_angle = 90;
    scr_lerpvar("box_angle", 90, 0, 30, 2, "out");
}
else
{
    box_angle = 90;
    scr_lerpvar("box_angle", 90, 180, 30, 2, "out");
}
phase = "stalk";
phase_timer = -35;
segment_list = ds_list_create();
point_list = ds_list_create();
centipath = path_add();
path_set_kind(centipath, true);
path_set_closed(centipath, false);
ds_list_add(segment_list, id);

chase_heart = function()
{
    var hx = obj_heart.x + 10;
    var hy = obj_heart.y + 10;
    if (i_ex(obj_heart))
    {
        if (image_alpha == 1 && light < 1 && phase == "stalk")
        {
            if (point_distance(x, y, hx, hy) < (obj_darkshape_light_aura.radius + 50))
            {
                light = scr_approach(light, 1, light_rate);
                light_treshold = scr_approach(light_treshold, 1, light_rate);
                if ((phase_timer % 3) == 0)
                {
                    light_damage = 0.12;
                    with (instance_create_depth(x, y, depth + 1, obj_afterimage_anim))
                    {
                        direction = scr_at_player(x, y) + 180;
                        speed = 1;
                        sprite_index = other.sprite_index;
                        image_xscale = other.image_xscale - 0.25;
                        image_yscale = other.image_yscale - 0.25;
                        scr_lerpvar("image_xscale", other.image_xscale - 0.25, other.image_xscale + 0.25, 16);
                        scr_lerpvar("image_yscale", other.image_yscale - 0.25, other.image_yscale + 0.25, 16);
                        image_alpha = 0.5;
                        fade = 0.03125;
                    }
                }
                if (light == 1)
                {
                    shakeme = false;
                    image_s = 0.5;
                    image_d = 0;
                    image_max = 2;
                    image_min = 0;
                    with (obj_lerpvar)
                    {
                        if (variable_instance_exists(id, "movevar"))
                            instance_destroy();
                    }
                    death_dir = point_direction(scr_get_box(4), scr_get_box(5), x, y);
                    scr_lerpvar("x", x, x + lengthdir_x(100, death_dir), 16, 1, "out");
                    scr_lerpvar("y", y, y + lengthdir_y(100, death_dir), 16, 1, "out");
                    death_dir += choose(-100, 100);
                    snd_stop(snd_tspawn);
                    deathrattle = snd_play(snd_tspawn, 1, 1);
                    clear_spawn();
                    with (instance_create_depth(x, y, depth, obj_bulletparent))
                    {
                        image_xscale = 0.25;
                        image_yscale = 0.25;
                        sprite_index = spr_finisher_explosion;
                        image_index = 2;
                        image_speed = 1/3;
                        image_blend = c_gray;
                        scr_lerpvar("image_xscale", 0.25, 4, 12);
                        scr_lerpvar("image_yscale", 0.25, 4, 12);
                        scr_script_delayed(instance_destroy, 12);
                    }
                    repeat (12)
                    {
                        randir = irandom(360);
                        with (instance_create_depth(x + lengthdir_x(32, randir), y + lengthdir_y(32, randir), depth + 2, obj_particle_generic))
                        {
                            image_xscale *= 2;
                            image_yscale *= 2;
                            sprite_index = spr_ring_particle1;
                            image_blend = c_white;
                            direction = point_direction(other.x, other.y, x, y);
                            speed = 2 + random(6);
                            shrink_rate = 0.15 + random(0.1);
                        }
                    }
                    phase_timer = 0;
                    phase = "death";
                }
                if (light_treshold > 0.5 && light < 1)
                {
                    shakeme = false;
                    image_s = 0.5;
                    image_d = 0;
                    image_max = 2;
                    image_min = 0;
                    with (obj_lerpvar)
                    {
                        if (variable_instance_exists(id, "movevar"))
                            instance_destroy();
                    }
                    with (scr_lerpvar("box_distance", 100, 220, 15, 3, "out"))
                        movevar = true;
                    light_treshold = 0;
                    snd_play(snd_tspawn, 1, 1.5);
                    snd_play(snd_tspawn, 1, 1);
                    snd_play(snd_tspawn, 1, 0.5);
                    clear_spawn();
                    with (instance_create_depth(x, y, depth, obj_bulletparent))
                    {
                        image_xscale = 0.25;
                        image_yscale = 0.25;
                        sprite_index = spr_finisher_explosion;
                        image_index = 2;
                        image_speed = 1/3;
                        image_blend = c_gray;
                        scr_lerpvar("image_xscale", 0.25, 4, 12);
                        scr_lerpvar("image_yscale", 0.25, 4, 12);
                        scr_script_delayed(instance_destroy, 12);
                    }
                    repeat (12)
                    {
                        randir = irandom(360);
                        with (instance_create_depth(x + lengthdir_x(32, randir), y + lengthdir_y(32, randir), depth + 2, obj_particle_generic))
                        {
                            image_xscale *= 2;
                            image_yscale *= 2;
                            sprite_index = spr_ring_particle1;
                            image_blend = c_white;
                            direction = point_direction(other.x, other.y, x, y);
                            speed = 2 + random(6);
                            shrink_rate = 0.15 + random(0.1);
                        }
                    }
                    phase_timer = 0;
                    phase = "sudden reposition";
                }
                with (obj_darkshape_manager)
                {
                    ominous_decline = false;
                    ominous_volume = scr_approach(ominous_volume, 1, (1 - ominous_volume) * 0.25);
                }
                var randir = scr_at_player(x, y) + irandom_range(-45, 45);
                if (!irandom(2))
                {
                    with (instance_create_depth(x - lengthdir_x(32, randir), y - lengthdir_y(32, randir), depth + 2, obj_particle_generic))
                    {
                        image_blend = c_white;
                        direction = point_direction(other.x, other.y, x, y);
                        speed = 1 + random(3);
                        shrink_rate = 0.2;
                    }
                }
            }
        }
    }
};

clear_spawn = function()
{
    with (obj_darkshape)
    {
        if (id != other.id)
        {
            light = 1;
            check_death();
        }
    }
    with (obj_darkshape_spawnbullet)
    {
        var randir = irandom(360);
        with (instance_create_depth(x, y, depth + 2, obj_particle_generic))
        {
            image_xscale *= 2;
            image_yscale *= 2;
            sprite_index = spr_ring_particle1;
            image_blend = c_white;
            direction = randir;
            speed = 1 + random(3);
            shrink_rate = 0.15 + random(0.1);
        }
        instance_destroy();
    }
};
