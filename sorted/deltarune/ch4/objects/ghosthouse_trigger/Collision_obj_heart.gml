if (active)
{
    if (tutu)
    {
        if (tutu == 1)
        {
            with (obj_your_tutu)
                alarm[0] = 30;
            visible = false;
            tutu = 9;
        }
        else if (tutu == 3)
        {
            if (room == room_bullettest || room == room_bullettest_new)
            {
                var mus = mus_play(snd_init("pumpkin_boss.ogg"));
                audio_sound_set_track_position(mus, 21);
            }
            with (obj_battlesolid)
            {
                if (mask_index == spr_no_mask && sprite_index != spr_ghost_house_yourtutu_inner)
                    image_blend = merge_color(c_red, c_black, 0.6);
                else
                    image_blend = c_red;
            }
            with (obj_gh_bouncebarrier)
                image_blend = merge_color(c_red, c_black, 0.6);
            with (obj_ghosthouse_trigger)
                active = false;
            with (obj_ghosthouse_jackolantern)
            {
                sprite_index = spr_guywhoappearswhenyouhavetakentoolonginaghosthouse;
                fully_aggro = true;
                active = true;
                damage = 100;
                if (x < -75)
                    x = -75;
                speed_scale = true;
                snd_resume(global.batmusic[0]);
            }
        }
    }
    else
    {
        active = false;
        with (obj_ghosthouse_jackolantern)
        {
            pause = true;
            store_speed = path_speed;
            path_speed = 0;
        }
        var _depth = obj_heart.depth + 1 + alternate;
        pumpkin = instance_create_depth(obj_dbulletcontroller.pumpkin_x, obj_dbulletcontroller.pumpkin_y, _depth, obj_ghosthouse_jackolantern);
        if (instance_exists(obj_your_tutu))
        {
            with (obj_battlesolid)
            {
                if (image_xscale == -2)
                    instance_destroy();
            }
        }
        if (alternate == 1)
        {
            with (pumpkin)
            {
                polite = true;
                active = false;
                sprite_index = spr_jackolantern_but_politer;
                linked_block = instance_create_depth(x, y, -100, obj_battlesolid);
                linked_block.sprite_index = spr_jackolantern_but_politer;
                linked_block.image_xscale = 0.9;
                linked_block.image_yscale = 0.9;
                linked_block.visible = false;
            }
        }
        else if (alternate == 2)
        {
            with (pumpkin)
            {
                small = true;
                sprite_index = spr_small_jackolantern;
                with (obj_gh_fireball_bouncy)
                {
                    if (doomed)
                        instance_destroy();
                }
            }
        }
        if (alternate == 2)
        {
            with (obj_darkness_overlay)
                draw_all_solids = true;
            with (obj_battlesolid)
            {
                if (image_yscale == -3)
                {
                    mask_index = spr_nothing;
                    scr_lerpvar("image_angle", image_angle, image_angle - 90, 72, -2, "inout");
                }
            }
        }
        instance_destroy();
        if (chimney)
        {
            pumpkin.timer = -55 + (15 * (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat));
            pumpkin.x += 45;
            pumpkin.move_directly = true;
            pumpkin.mask_index = spr_jackolantern_but_politer;
            with (pumpkin)
                scr_lerpvar("x", x, x - 120, 25, -1, "out");
            with (obj_gh_exitsign)
            {
                instance_destroy();
                gravity = 0.1;
            }
        }
        with (obj_battlesolid)
        {
            if (mask_index == spr_no_mask && sprite_index != spr_ghost_house_yourtutu_inner)
                image_blend = merge_color(c_yellow, c_black, 0.6);
            else
                image_blend = c_yellow;
        }
        with (obj_gh_bouncebarrier)
            image_blend = merge_color(c_yellow, c_black, 0.6);
    }
}
