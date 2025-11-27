if (global.chapter == 4)
{
    if (global.plot < 300)
    {
        if (global.flag[20] == 1)
        {
            if (global.interact == 1)
            {
                with (obj_npc_room)
                {
                    if (sprite_index == spr_chairiel && normalanim == 1)
                    {
                        normalanim = -1;
                        image_speed = 0;
                    }
                }
            }
            else
            {
                global.flag[20] = 0;
            }
        }
        if (global.flag[20] == 0)
        {
            with (obj_npc_room)
            {
                if (sprite_index == spr_chairiel && normalanim == -1)
                    normalanim = 1;
            }
        }
        if (toriel_convo)
        {
            if (obj_mainchara.x < 360 && global.interact == 0)
            {
                toriel_con = 1;
                global.interact = 1;
                global.facing = 1;
                with (obj_caterpillarchara)
                {
                    fun = 1;
                    sprite_index = rsprite;
                    image_index = 0;
                }
            }
            if (toriel_speaking)
            {
                if (i_ex(obj_writer))
                {
                    with (obj_npc_room)
                    {
                        if (sprite_index == spr_chairiel)
                        {
                            normalanim = -1;
                            if (obj_writer.halt > 0)
                            {
                                image_speed = 0;
                                image_index = 0;
                            }
                            if (obj_writer.halt == 0)
                                image_speed = 0.2;
                        }
                    }
                }
            }
            if (toriel_con == 1)
            {
                toriel_con = 2;
                global.flag[20] = 3;
                toriel_speaking = true;
                scr_speaker("toriel");
                msgsetloc(0, "\\E1* By the way^1, I am leaving for choir practice in a little while./", "obj_room_torhouse_slash_Step_0_gml_77_0");
                msgnextloc("\\E0* If you need anything^1, just come by the church^1, okay^1, honey?/%", "obj_room_torhouse_slash_Step_0_gml_78_0");
                var d = d_make();
                d.msgside = 1;
            }
            if (toriel_con == 2 && !d_ex())
            {
                global.interact = 0;
                global.facing = 0;
                toriel_convo = false;
                toriel_con = 99;
                toriel_speaking = false;
                with (obj_npc_room)
                {
                    if (sprite_index == spr_chairiel)
                    {
                        normalanim = 1;
                        image_speed = 0;
                    }
                }
                with (obj_caterpillarchara)
                    fun = 0;
                scr_flag_set(831, 1);
            }
        }
    }
}
