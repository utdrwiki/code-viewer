event_inherited();
grazed = 1;
grazepoints = 0;
destroyonhit = true;
with (obj_darkshape_manager)
    only_centipedes = false;
if (y >= obj_growtangle.y)
    direction = 250 - irandom(10);
else
    direction = 110 + irandom(10);
speed_max = 2.25;
speed_max_multiplier = 1;
tracking_val = 16;
speedfactor = 1;
true_timer = 0;
fastval = 4;
accel = 0.15;
individuality = irandom(100);
canbepushed = true;
pushback_radius = 48;
myspeed = 0;
active = false;
image_alpha = 0;
image_speed = 0;
shrink_sprite = spr_darkshape;
xscale = 0;
yscale = 0;
light = 0;
light_rate = 0.05;
light_recover = 0.01;
image = 0;
radius = 20;
shakeme = false;
timer = 0;
fast_timer = 0;
my_surface = -4;
xface = 1;
yface = 1;
scalefactor = 1;
ypush = 0;

do_shrivel = function()
{
    if (light > 0.99)
    {
        image = 5;
    }
    else if (light > 0.8)
    {
        image = 4;
        radius = 8;
    }
    else if (light > 0.6)
    {
        image = 3;
        radius = 10;
    }
    else if (light > 0.4)
    {
        image = 2;
        radius = 13;
    }
    else if (light > 0.2)
    {
        image = 1;
        radius = 16;
    }
    else
    {
        image = 0;
        radius = 20;
    }
};

do_pushback = function()
{
    with (obj_darkshape)
    {
        if (canbepushed)
        {
            if (id != other.id && point_distance(x, y, other.x, other.y) < other.pushback_radius)
            {
                var tempangle = point_direction(other.x, other.y, x, y);
                x += lengthdir_x(1, tempangle);
                y += lengthdir_y(1, tempangle);
            }
        }
    }
};

check_death = function()
{
    var hx = obj_heart.x + 10;
    var hy = obj_heart.y + 10;
    if (light == 1)
    {
        instance_destroy();
        with (instance_create_depth(x, y, depth + 1, obj_darkshape_greenblob))
        {
            hx = obj_growtangle.x;
            hy = obj_growtangle.y;
            size = 1;
            if (!obj_darkshape_manager.basic_shapes || i_ex(obj_darkshape_blast_tester) || i_ex(obj_darkshape_giant))
                size = 0;
            if ((other.shrink_sprite != spr_darkshape_directed_small && !i_ex(obj_darkshape_blast_tester)) || i_ex(obj_darkshape_giant))
            {
            }
            else if (i_ex(obj_darkshape_blast_tester))
            {
                if ((obj_darkshape_manager.dark_count % 3) == 0)
                    size++;
            }
            else if ((obj_darkshape_manager.dark_count % (2 + obj_darkshape_manager.phase_difficulty)) == 0)
            {
                size++;
            }
            if (i_ex(obj_titan_spawn_enemy))
                size = 2;
            prime_me();
        }
        with (obj_darkshape_manager)
            dark_count++;
    }
};

chase_heart = function()
{
    var hx = obj_heart.x + 10;
    var hy = obj_heart.y + 10;
    if (i_ex(obj_heart))
    {
        if (point_distance(x, y, hx, hy) < (obj_darkshape_light_aura.radius + 8) && image_blend != c_red)
        {
            myspeed = scr_approach(myspeed, 0.7 + (1 - light), 0.15 * speedfactor * speed_max_multiplier);
            light = scr_approach(light, 1, light_rate);
            with (obj_darkshape_manager)
            {
                ominous_decline = false;
                ominous_volume = scr_approach(ominous_volume, 1, (1 - ominous_volume) * 0.15);
            }
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
            myspeed = scr_approach(myspeed, speed_max * speed_max_multiplier, accel * speed_max_multiplier * (1 - light));
            light = scr_approach(light, 0, light_recover);
        }
    }
};

snd_play(snd_dark_odd, 0.25, 0.35 + random(0.35));
