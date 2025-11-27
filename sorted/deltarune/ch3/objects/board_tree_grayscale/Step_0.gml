if (init == 0)
{
    if (boss)
        image_blend = #FF3652;
    mysolid = instance_create(x, y, obj_board_solid);
    init = true;
}
if (active)
{
    scr_depth_board();
    if (boss)
    {
        if (bosscon == 0)
        {
            if (myinteract == 3)
            {
                obj_b2heartisland.con = 1;
                bosscon = 0.1;
                scr_speaker("no_name");
                msgsetloc(0, "YOU FOUND \\cYTHE TROPIC OF LOVE\\cW!/%", "obj_board_tree_grayscale_slash_Step_0_gml_30_0");
                bw_make();
                global.interact = 1;
            }
        }
        if (bosscon == 0.1 && !bw_ex())
        {
            global.interact = 0;
            bosscon = 1;
        }
        if (bosscon == 1)
        {
            bosstimer++;
            if (bosstimer == 1)
            {
                with (object_index)
                    con = 0.1;
                snd_pause(global.currentsong[1]);
                var song = snd_init("ch3_south_of_the_border.ogg");
                coolbeat = snd_loop(song);
                bosscon = 2;
            }
        }
        if (bosscon == 2)
        {
            var endboat = false;
            with (obj_mainchara_board)
            {
                if (name == "kris")
                {
                    if (place_meeting(x, y, obj_board_dock))
                        endboat = true;
                }
            }
            if (endboat == true)
            {
                bosscon = 3;
                snd_volume(coolbeat, 0, 15);
                snd_volume(global.currentsong[1], 0, 0);
                snd_resume(global.currentsong[1]);
                mus_volume(global.currentsong[1], 1, 30);
                with (obj_board_tree_grayscale)
                {
                    safe_delete(mysolid);
                    scr_lerpvar("y", y, -100, 60 + irandom(10), 2, "in");
                    scr_doom(id, 60);
                }
            }
        }
    }
    if (i_ex(mysolid))
    {
        mysolid.x = x;
        mysolid.y = y;
    }
    if (!boss)
    {
        if (con == 1 && y <= 0)
            instance_destroy();
    }
    if (room == room_board_2_sword && boss)
    {
        if (bosscon == 72)
        {
            if (active && obj_board_camera.con == 0)
            {
                if (i_ex(obj_board_swordhitbox))
                {
                    if (place_meeting(x, y, obj_board_swordhitbox))
                    {
                        with (fakeground)
                        {
                            scr_lerpvar("image_index", 0, 4, 8);
                            scr_doom(id, 10);
                        }
                        door = instance_create(x + 8, y + 8, obj_board_warptouch);
                        with (door)
                        {
                            warpx = 3584;
                            warpy = 1600;
                            playerX = 3776;
                            playerY = 1792;
                        }
                        safe_delete(mysolid);
                        instance_create(centerx(), centery(), obj_board_enemydefeatsplash);
                        snd_stop(snd_board_kill);
                        snd_play(snd_board_kill_ominous);
                        instance_destroy();
                    }
                }
            }
        }
    }
}
