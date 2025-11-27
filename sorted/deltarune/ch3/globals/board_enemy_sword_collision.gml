function scr_board_enemy_sword_collision()
{
    var deer_following = false;
    if (object_index == obj_board_enemy_deer && follow == true)
        deer_following = true;
    if (place_meeting(x, y, obj_board_swordhitbox) && hurttimer == 0 && obj_board_controller.kris_object.swordlv >= sword_immunity_lv && deer_following == false)
    {
        var hitbox = instance_place(x, y, obj_board_swordhitbox);
        if (hitbox.detectiononly == true)
        {
            with (obj_mainchara_board)
            {
                if (swordbuffer <= 0)
                {
                    swordbuffer = 8;
                    canfreemove = 0;
                    snd_play(choose(snd_board_sword1, snd_board_sword2, snd_board_sword3));
                }
            }
        }
        else if ((object_index == obj_board_enemy_monster && image_blend == c_gray) || (object_index == obj_board_enemy_bluebird && room == room_board_dungeon_2))
        {
            snd_stop(snd_board_sword_metal);
            snd_play(snd_board_sword_metal);
            hitdir = -1;
            hurttimer = 10;
        }
        else
        {
            path_end();
            hurttimer = 10;
            snd_stop(snd_board_damage);
            snd_play(snd_board_damage);
            active_hitbox = false;
            hitdir = obj_board_controller.kris_object.facing;
            if (hp != 999)
                hp--;
        }
    }
    if (place_meeting(x, y, obj_board_enemy_deer_ice_spell) && object_index != obj_board_enemy_deer)
    {
        snd_stop(snd_board_splash);
        snd_play(snd_board_splash);
        if (object_index != obj_board_enemy_bluefish && object_index != obj_board_enemy_yellowflower)
        {
            block = instance_create(x, y, obj_pushableblock_board);
            block.sprite_index = spr_board_pushableblock_ice;
            block.custom_sprite = spr_board_pushableblock_ice;
            block.image_xscale = 1;
            block.image_yscale = 1;
            var x_cell = floor(block.x / global.cell_size);
            var y_cell = floor((block.y + 18) / global.cell_size);
            var position_x = (x_cell * global.cell_size) + (global.cell_size / 2);
            var position_y = (y_cell * global.cell_size) + (global.cell_size / 2);
            block.x = position_x - 16;
            block.y = position_y - 16;
            var count = 6;
            for (var i = 0; i < count; i++)
            {
                var fx = scr_board_marker((block.x + 16) - 2, (block.y + 16) - 2, spr_board_snowflake, 0.3, 100000, 2);
                fx.direction = ((360 / count) * i) + 45;
                fx.speed = 8;
                fx.friction = 0.6;
                scr_doom(fx, 10);
                fx = scr_board_marker((block.x + 16) - 2, (block.y + 16) - 2, spr_board_snowflake, 0.3, 100000, 2);
                fx.direction = (360 / count) * i;
                fx.speed = 4;
                fx.friction = 0.3;
                scr_doom(fx, 10);
            }
        }
        else
        {
            var count = 6;
            for (var i = 0; i < count; i++)
            {
                var fx = scr_board_marker((x + 16) - 2, (y + 16) - 2, spr_board_snowflake, 0.3, 100000, 2);
                fx.direction = ((360 / count) * i) + 45;
                fx.speed = 8;
                fx.friction = 0.6;
                scr_doom(fx, 10);
                fx = scr_board_marker((x + 16) - 2, (y + 16) - 2, spr_board_snowflake, 0.3, 100000, 2);
                fx.direction = (360 / count) * i;
                fx.speed = 4;
                fx.friction = 0.3;
                scr_doom(fx, 10);
            }
        }
        instance_destroy();
        if (spawnerid != -1 && i_ex(spawnerid))
        {
            if (object_index != obj_board_enemy_yellowflower && object_index != obj_board_enemy_bluefish)
                spawnerid.image_index = 20;
            else
                safe_delete(spawnerid);
        }
    }
    if (place_meeting(x, y, obj_board_swordhitbox) && hurttimer == 0 && obj_board_controller.kris_object.swordlv < sword_immunity_lv && deer_following == false)
    {
        snd_stop(snd_board_sword_metal);
        snd_play(snd_board_sword_metal);
        if (object_index == obj_board_enemy_monster)
        {
            hitdir = -1;
            hurttimer = 10;
        }
        if (object_index == obj_board_enemy_yellowflower || object_index == obj_board_enemy_bluefish || object_index == obj_board_enemy_bluebird_board1)
            hurttimer = 10;
    }
}
