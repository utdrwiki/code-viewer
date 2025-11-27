if (i_ex(obj_tenna_enemy) && tennainit == false)
{
    visible = true;
    tennainit = true;
}
depth = 10000 - y;
if (i_ex(obj_tenna_enemy))
    depth = 1000 - y;
shake *= 0.8;
flash = scr_approach(flash, 0, 1);
healflash = scr_approach(healflash, 0, 1);
damage_cooldown = scr_approach(damage_cooldown, 0, 1);
if (sprite_index == spr_susiezilla_ralsei_tower && hp != maxhp)
{
    with (obj_tenna_zoom)
        hurt_counter = 1;
}
if (shake < 0.5)
    shake = 0;
polarity *= -1;
if (hp == 0)
{
    with (obj_minigame_quit_ui)
        instance_destroy();
    with (obj_susiezilla_gamecontroller)
        shake = 8;
    flash = 10;
    shake = 4;
    image_xscale = scr_approach(image_xscale, 3, 0.025);
    image_yscale = scr_approach(image_yscale, 0, 0.025);
    with (obj_tenna_enemy)
    {
        if (minigamefailcount < 3)
            minigamefailcount++;
    }
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
                immune = true;
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
with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        exit;
}
if (place_meeting(x, y, obj_susiezilla_laser_segment))
    take_hit(1, 1, 1);
if (scr_debug() && keyboard_check_pressed(vk_backspace))
{
    tv_is_forever = !tv_is_forever;
    if (tv_is_forever)
        debug_print("Godmode ON.");
    else
        debug_print("Godmode OFF.");
}
