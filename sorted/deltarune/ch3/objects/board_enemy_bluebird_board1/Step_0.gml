updatetimer++;
if (updatetimer == 2)
    updatetimer = 0;
else
    exit;
if (yoffset > -15)
    scr_board_enemy_sword_collision();
if (hurttimer > 0)
{
    hurttimer--;
    active_hitbox = false;
    if (hurttimer == 0 && hp != maxhp)
        active_hitbox = true;
    if (hurttimer == 9 && hp <= 0)
    {
        splash = instance_create_depth(centerx(), centery() - 6, depth - 2, obj_board_enemydefeatsplash);
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
}
if (movecon == -1)
{
    if (movetimer > -50 && movetimer < -30)
    {
        image_index += lerp(0, 1, (movetimer + 30) / -20);
        yoffset = round(lerp(0, -24, (movetimer + 30) / -20) / 2) * 2;
    }
    if (movetimer > -30 && movetimer < -20)
        image_index = 1;
    if (movetimer > -20 && movetimer < 0)
        image_index += lerp(1, 0, movetimer / -20);
    if (movetimer > -10 && movetimer < 0)
        yoffset = round(lerp(-24, 0, movetimer / -10) / 2) * 2;
    if (movetimer == -1)
    {
        startingx = x;
        startingy = y;
        var rand = choose(0, 1, 2, 3, 4, 5);
        if (randprev == rand)
            rand++;
        if (rand > 5)
            rand = 0;
        randprev = rand;
        if (rand == 0)
        {
            destinationx = 448;
            destinationy = 256;
        }
        if (rand == 1)
        {
            destinationx = 160;
            destinationy = 256;
        }
        if (rand == 2)
        {
            destinationx = 160;
            destinationy = 96;
        }
        if (rand == 3)
        {
            destinationx = 448;
            destinationy = 96;
        }
        if (rand == 4)
        {
            destinationx = 256;
            destinationy = 160;
        }
        if (rand == 5)
        {
            destinationx = 352;
            destinationy = 192;
        }
        distance = point_distance(startingx, startingy, destinationx, destinationy) / 5.3;
    }
    if (movetimer >= 0)
    {
        if (con == 0 && movespd < 2)
            movespd += 0.1;
        if (con == 1 && movespd > 0.3)
            movespd -= 0.1;
        if (movecon == -1 && movetimer >= (distance - (11 * movespd)))
            con = 1;
        movetimer += movespd;
        image_index++;
        if (movetimer > distance)
            movetimer = distance;
        x = lerp(startingx, destinationx, movetimer / distance);
        y = lerp(startingy, destinationy, movetimer / distance);
        if (movetimer >= distance)
        {
            movetimer = -50;
            con = 0;
            movespd = 0;
            image_index = 0;
        }
    }
    else
    {
        movetimer++;
    }
}
