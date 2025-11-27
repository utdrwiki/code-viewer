if (global.chapter == 4)
{
    if (global.plot >= 40 && global.plot < 100)
    {
        if (obj_mainchara.x < 495)
        {
            if (i_ex(snailcar_npc))
            {
                with (snailcar_npc)
                {
                    if (place_meeting(x, y, obj_mainchara))
                    {
                        if (y < obj_mainchara.y)
                        {
                            with (obj_mainchara)
                                y += 1;
                        }
                        else
                        {
                            with (obj_mainchara)
                                y -= 1;
                        }
                    }
                }
                if (!snail_hit)
                {
                    if (snailcar_npc.x != (snailcar_npc.xstart - 30))
                        snailcar_npc.x = scr_movetowards(snailcar_npc.x, snailcar_npc.xstart - 30, 0.1);
                    else
                        snail_hit = true;
                }
                else if (snailcar_npc.x != snailcar_npc.xstart)
                {
                    snailcar_npc.x = scr_movetowards(snailcar_npc.x, snailcar_npc.xstart, 0.1);
                }
                else
                {
                    snail_hit = false;
                }
            }
        }
    }
    if (rainy_active)
    {
        if (!rainy_init)
        {
            rainy_init = true;
            var puddle_marker = scr_marker(120, 150, spr_small_puddle);
            with (puddle_marker)
                scr_depth();
            rainy_npc = scr_marker_animated(130, 152, spr_npc_rainykid_flip);
            rainy_npc.depth = puddle_marker.depth - 10;
            var rainy_collider = instance_create(puddle_marker.x, 135, obj_solidblock);
            var rainy_readable = instance_create(rainy_collider.x, rainy_collider.y, obj_readable_room1);
        }
        else
        {
            rainy_timer++;
            if ((rainy_timer % 16) == 1)
            {
                with (rainy_npc)
                    scr_flip("x");
            }
            rainy_siner += 0.6;
            rainy_npc.x = rainy_npc.xstart + (sin(rainy_siner / 3) * 3);
        }
    }
    if (susie_check)
    {
        if (con == 10 && obj_mainchara.y >= 100 && global.interact == 0)
        {
            con = 11;
            global.interact = 1;
            scr_speaker("susie");
            msgsetloc(0, "\\E0* Hey..^1. we haven't seen Ralsei today./%", "obj_room_town_south_slash_Step_0_gml_95_0");
            var d = d_make();
        }
        if (con == 11 && !d_ex())
        {
            con = 14;
            scr_delay_var("con", 15, 15);
            var facing_temp = "";
            with (obj_caterpillarchara)
            {
                if (name == "susie")
                {
                    fun = 1;
                    facing_temp = sprite_index;
                    sprite_index = rsprite;
                    image_index = 0;
                }
            }
            susie_facing = facing_temp;
        }
        if (con == 15 && !d_ex())
        {
            con = 20;
            global.msc = 1425;
            scr_text(global.msc);
            var d = d_make();
        }
        if (con == 20 && !d_ex())
        {
            con = -1;
            susie_check = false;
            global.interact = 0;
            var facing_temp = susie_facing;
            with (obj_caterpillarchara)
            {
                if (name == "susie")
                {
                    fun = 0;
                    sprite_index = facing_temp;
                }
            }
        }
    }
}
