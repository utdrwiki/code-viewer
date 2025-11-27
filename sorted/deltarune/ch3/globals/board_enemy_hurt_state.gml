function scr_board_enemy_hurt_state()
{
    if (hurttimer > 0)
    {
        hurttimer--;
        active_hitbox = false;
        if (hurttimer == 0 && hp != maxhp)
            active_hitbox = true;
        if (hurttimer == 9 && hp <= 0)
        {
            splash = instance_create_depth(centerx(), centery(), depth - 2, obj_board_enemydefeatsplash);
            splash.depth = depth - 1;
            global.flag[1255]++;
            obj_board_controller.kris_object.xp += xp_given;
            instance_destroy();
            var a = true;
            if (object_index == obj_board_enemy_monster && hp == 999)
                a = false;
            if (spawnerid != -1 && i_ex(spawnerid) && a == true)
            {
                with (spawnerid)
                    instance_destroy();
            }
            if (drop_candy == true)
            {
                var drop_rate = 5;
                if (obj_board_controller.kris_object.myhealth < 8)
                    drop_rate += 20;
                if (obj_board_controller.kris_object.myhealth < 3)
                    drop_rate += 30;
                if (obj_board_controller.kris_object.myhealth == obj_board_controller.kris_object.maxhealth)
                    drop_rate = 0;
                if (irandom(100) < drop_rate || (obj_board_controller.kris_object.monstersdefeated >= 6 && drop_rate > 0) || (obj_board_controller.kris_object.monstersdefeated >= 3 && obj_board_controller.kris_object.myhealth < 3 && drop_rate > 0))
                {
                    splash.drop_candy = true;
                    obj_board_controller.kris_object.monstersdefeated = 0;
                }
                else
                {
                    obj_board_controller.kris_object.monstersdefeated++;
                }
            }
        }
        var dontmove = false;
        if (object_index == obj_board_enemy_lizard && movecon == 3)
            dontmove = true;
        if (hurttimer > 6 && dontmove == false)
        {
            if (hitdir == 0)
            {
                repeat (20)
                {
                    if (!place_meeting(x, y + 1, obj_board_solid))
                        y += 1;
                    else
                        break;
                }
            }
            if (hitdir == 1)
            {
                repeat (20)
                {
                    if (!place_meeting(x + 1, y, obj_board_solid))
                        x += 1;
                    else
                        break;
                }
            }
            if (hitdir == 2)
            {
                repeat (20)
                {
                    if (!place_meeting(x, y - 1, obj_board_solid))
                        y -= 1;
                    else
                        break;
                }
            }
            if (hitdir == 3)
            {
                repeat (20)
                {
                    if (!place_meeting(x - 1, y, obj_board_solid))
                        x -= 1;
                    else
                        break;
                }
            }
        }
    }
    if (object_index == obj_board_enemy_lizard && movecon == 3)
    {
        if (x < 160)
            x = 160;
        if (x > 448)
            x = 448;
        if (y < 0)
            y = 0;
        if (y > 256)
            y = 256;
    }
    else if (object_index != obj_board_enemy_silentcat)
    {
        if (x < 160)
            x = 160;
        if (x > 448)
            x = 448;
        if (y < 96)
            y = 96;
        if (y > 256)
            y = 256;
    }
}
