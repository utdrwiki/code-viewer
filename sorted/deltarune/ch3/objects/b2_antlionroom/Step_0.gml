scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 8)
        {
            scr_pathfind_to_point("susie", choose(1, 10), 1, 0);
            suwalk = 1;
            susie.sleepy = true;
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (!made)
        {
            made = 1;
            antlion[0] = instance_create_board(2, 3, obj_board_antlion);
            antlion[1] = instance_create_board(2, 5, obj_board_antlion);
            antlion[2] = instance_create_board(8, 4, obj_board_antlion);
            antlion[3] = instance_create_board(5, 4, obj_board_antlion);
            antlion[0].boss = true;
            antlion[0].direction = 45 + (90 * choose(0, 1, 2, 3));
            antlion[1].direction = 15 + (90 * choose(0, 1, 2, 3));
            antlion[2].direction = 33 + (90 * choose(0, 1, 2, 3));
            antlion[3].direction = 66 + (90 * choose(0, 1, 2, 3));
            for (var i = 0; i < 4; i++)
                antlion[i].photod = photod[i];
        }
        if (made == 1)
        {
            var allcapt = 0;
            for (var i = 0; i < 4; i++)
            {
                if (antlion[i].photod == true)
                    photod[i] = true;
                allcapt += antlion[i].photod;
            }
            if (allcapt == 4 && global.flag[1227] == 1)
            {
                debug_print("all capt");
                made = 2;
                with (obj_board_antlion)
                    hide = 1;
            }
        }
        if (made == 2)
        {
            var cont = 0;
            for (var i = 0; i < 4; i++)
            {
                if (antlion[i].con == 40)
                    cont++;
            }
            if (cont == 4)
            {
                with (obj_board_antlion)
                    instance_destroy();
                made = 3;
                timer = 0;
            }
        }
        if (made == 3 && obj_board_camera.con == 0)
        {
            timer++;
            if (timer >= 8)
            {
                for (var i = 0; i < 4; i++)
                {
                    antlion[i] = instance_create(x, y, obj_board_antlion);
                    antlion[i].con = 50;
                    antlion[i].photod = 1;
                    antlion[i].init = 1;
                    antlion[i].image_alpha = 0;
                    antlion[i].timer = -2 - (i * 4);
                }
                made = 4;
                timer = 0;
            }
        }
        if (made == 4)
        {
            timer++;
            var mvspd = 8;
            var dist = 24;
            antlion[0].x = x + 80 + (sin((timer + (mvspd * 0)) / mvspd) * dist);
            antlion[1].x = x + 80 + (sin((timer + (mvspd * 3)) / mvspd) * dist);
            antlion[0].y = y + 96 + (cos((timer + (mvspd * 0)) / mvspd) * dist);
            antlion[1].y = y + 96 + (cos((timer + (mvspd * 3)) / mvspd) * dist);
            antlion[2].x = x + 208 + (sin((-timer - (mvspd * 0)) / mvspd) * dist);
            antlion[3].x = x + 208 + (sin((-timer - (mvspd * 3)) / mvspd) * dist);
            antlion[2].y = y + 96 + (cos((-timer - (mvspd * 0)) / mvspd) * dist);
            antlion[3].y = y + 96 + (cos((-timer - (mvspd * 3)) / mvspd) * dist);
            if ((timer % 30) == 0)
            {
                with (instance_create(x + 80 + 16, y + 96 + 32, obj_board_marker))
                {
                    scr_limitval_upper(id, "y", y - 16);
                    sprite_index = spr_shootout_heart_outline;
                    image_blend = #E2003B;
                    scr_depth_board();
                    scr_darksize();
                    vspeed = -4;
                    friction = 0.2;
                    camkill = true;
                    var starttime = 15;
                    var fadetime = 2;
                    scr_delay_var("image_alpha", 0, starttime + (fadetime * 0));
                    scr_delay_var("image_alpha", 1, starttime + (fadetime * 1));
                    scr_delay_var("image_alpha", 0, starttime + (fadetime * 2));
                    scr_delay_var("image_alpha", 1, starttime + (fadetime * 3));
                    scr_doom(id, starttime + (fadetime * 4));
                }
            }
            if (((timer + 15) % 30) == 0)
            {
                with (instance_create(x + 208 + 16, y + 96 + 32, obj_board_marker))
                {
                    scr_limitval_upper(id, "y", y - 16);
                    sprite_index = spr_shootout_heart_outline;
                    image_blend = #E2003B;
                    scr_depth_board();
                    scr_darksize();
                    vspeed = -4;
                    friction = 0.2;
                    camkill = true;
                    var starttime = 15;
                    var fadetime = 2;
                    scr_delay_var("image_alpha", 0, starttime + (fadetime * 0));
                    scr_delay_var("image_alpha", 1, starttime + (fadetime * 1));
                    scr_delay_var("image_alpha", 0, starttime + (fadetime * 2));
                    scr_delay_var("image_alpha", 1, starttime + (fadetime * 3));
                    scr_doom(id, starttime + (fadetime * 4));
                }
            }
        }
    }
}
else
{
    if (made == 1)
        made = 0;
    if (made == 2)
        made = 3;
    if (made == 4)
        made = 3;
    timer = 0;
    suwalk = 0;
    suwalktimer = 0;
}
