depth = 10000 - y;
if (hp != 0)
{
    image_xscale = scr_approach(image_xscale, 2, 0.1);
    image_yscale = scr_approach(image_yscale, 2, 0.05);
}
shake = scr_approach(shake, 0, 0.5);
flash = scr_approach(flash, 0, 0.5);
damage_cooldown = scr_approach(damage_cooldown, 0, 1);
if (shake < 0.5)
    shake = 0;
polarity *= -1;
if (hp == 0)
{
    with (obj_susiezilla_gamecontroller)
        shake = 8;
    flash = 10;
    shake = 4;
    image_xscale = scr_approach(image_xscale, 3, 0.025);
    image_yscale = scr_approach(image_yscale, 0, 0.025);
    if ((global.time % 3) == 0)
    {
        with (scr_dark_marker(x + random_range(-58, 58), y - irandom(120), spr_realisticexplosion))
        {
            image_speed = 1;
            scr_doom(id, 16);
            scr_scale(2, id);
            depth = other.depth - 1;
        }
        repeat (3 + irandom(5))
        {
            with (instance_create_depth(x + ((10 + random(70)) * choose(-1, 1)), y - 24 - random(135), depth + choose(-1, 1), obj_dozer_parts))
            {
                var facing = x - other.x;
                sprite_index = spr_susiezilla_statue_chip;
                image_angle = irandom(360);
                scr_lerpvar("image_angle", image_angle, image_angle + ((90 + irandom(270)) * choose(-1, 1)), 30 + irandom(60));
                image_speed = 0;
                image_index = irandom(image_number - 1);
                image_xscale = 1 + (random(2) * choose(1, -1));
                image_yscale = image_xscale;
                h_speed = (sign(facing) * 2) + (random(10) * sign(facing));
                v_speed = -4 - random(8);
                ground = other.y;
            }
        }
    }
}
var dohit = false;
with (obj_susiezilla_player)
    dohit = hitactive;
if (hp)
{
    if (collision_rectangle(x - 50, y - 20, x + 50, y + 20, obj_susiezilla_player, false, true) && !damage_cooldown && dohit)
        take_hit();
}
