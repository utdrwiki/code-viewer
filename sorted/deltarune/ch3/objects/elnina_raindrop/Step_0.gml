event_inherited();
if (y > (scr_get_box(3) + 60))
{
    with (instance_create(x, scr_get_box(3) + 70, obj_regularbullet))
    {
        sprite_index = spr_raindrop_splash;
        image_index = 0;
        image_speed = 0;
        mask_index = spr_nothing;
        image_xscale = 1;
        image_yscale = 1.5;
        scr_lerpvar("image_index", 0, 4, 8);
        scr_lerpvar("image_xscale", 1, 0, 12);
        scr_lerpvar("image_yscale", 1.5, 0, 16);
        scr_script_delayed(instance_destroy, 16);
    }
    repeat (2 + irandom(2))
    {
        with (instance_create(x + random_range(-8, 8), scr_get_box(3) + 70, obj_particle_generic))
        {
            var timy = 16 + (irandom(4) * 2);
            var heighty = -80 + irandom(32);
            var scaly = 0.25 + random(0.5);
            alarm[0] = timy;
            image_xscale = scaly;
            image_yscale = scaly;
            scr_lerpvar("x", x, x + irandom_range(-48, 48), timy);
            scr_lerpvar("y", y, y + heighty, timy / 2, 1, "out");
            scr_script_delayed(scr_lerpvar, timy / 2, "y", y + heighty, y, timy / 2, 1, "in");
        }
    }
    instance_destroy();
}
timer++;
if (abs(direction - point_direction(x, y, target_x, target_y)) < 5 || timer > 48)
    done = true;
if (done)
{
    speed = scr_approach(speed, 12, 0.4);
    exit;
}
else
{
    speed = scr_approach(speed, 3, 0.75);
}
scr_ease_towards_direction_manual(point_direction(x, y, target_x, target_y), 10, 0.1);
image_angle = direction;
