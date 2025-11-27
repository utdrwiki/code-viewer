if (con < 0)
    exit;
if (con == 10)
{
    if (special_wobbler == -4)
        exit;
    if (obj_mainchara.x > (special_wobbler.x + (view_wport[0] / 2) + 40))
    {
        con = -1;
        special_wobbler.sprite_index = spr_dw_couch_shutta_hand;
        special_wobbler.x += 15;
        special_wobbler.y += 66;
    }
}
if (con == 20)
{
    if (open_chest)
    {
        if (chest_con == 0 && !d_ex() && global.interact == 0)
        {
            chest_con = 1;
            global.interact = 1;
            snd_play(snd_locker);
            with (treasure_marker)
                image_index = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* You opened the chest./%", "obj_ch3_couch_overworld_controller_slash_Step_0_gml_34_0");
            var _d = d_make();
            _d.stay = 5;
            scr_var_delay("chest_con", 2, 1);
        }
        if (chest_con == 2 && !d_ex())
        {
            chest_con = 3;
            scr_speaker("no_name");
            msgsetloc(0, "* Inside was 10 POINTs!/%", "obj_ch3_couch_overworld_controller_slash_Step_0_gml_48_0");
            var _d = d_make();
            _d.stay = 5;
            scr_var_delay("chest_con", 4, 1);
            points_display = instance_create(0, 0, obj_dw_points_fake_ui);
            with (points_display)
                display_points(10);
        }
        if (chest_con == 4 && !d_ex())
        {
            chest_con = 5;
            snd_play(snd_item);
            with (points_display)
                show_point_increase();
            scr_speaker("no_name");
            msgsetloc(0, "* 10 POINTs was added to your SCORE./%", "obj_ch3_couch_overworld_controller_slash_Step_0_gml_67_0");
            d_make();
            scr_var_delay("chest_con", 6, 1);
        }
        if (chest_con == 6 && !d_ex())
        {
            chest_con = 0;
            open_chest = false;
            global.interact = 0;
            with (points_display)
                instance_destroy();
        }
    }
    if (dustpile == -4)
        exit;
    if (scr_flag_get(1101) > 0)
        exit;
    if (dustpile.bust)
    {
        scr_flag_set(1101, 1);
        treasure_marker = scr_dark_marker(dustpile.x + 42, dustpile.y + 20, spr_treasurebox);
        treasure_marker.depth = dustpile.depth - 10;
        treasure_readable = instance_create(treasure_marker.x, treasure_marker.y, obj_readable_room1);
        with (treasure_readable)
        {
            image_xscale = 2;
            image_yscale = 2;
            extflag = "points";
        }
        var _dustpile_marker = scr_dark_marker(dustpile.x, dustpile.y, spr_dustpile_parts);
        _dustpile_marker.image_index = 3;
        _dustpile_marker.depth = dustpile.depth;
        var _dustpile_block = instance_create(dustpile.x + 10, dustpile.y + 60, obj_solidblock);
        with (_dustpile_block)
        {
            image_xscale = 5;
            image_yscale = 3;
        }
        scr_doom(dustpile, 7);
    }
}
if (con == 30)
{
    zapper_timer++;
    if (zapper_timer >= 300 && global.interact == 0)
    {
        con = -1;
        scr_flag_set(1102, 1);
        scr_script_delayed(snd_play, 11, snd_sneeze);
        with (zapper)
        {
            scr_var_delay("image_index", 1, 3);
            scr_var_delay("image_index", 2, 7);
            scr_var_delay("image_index", 3, 16);
            scr_lerpvar("image_yscale", 2, 1.5, 6, 3, "out");
            scr_script_delayed(scr_lerpvar, 7, "image_yscale", 2, 3, 6, 3, "out");
            scr_script_delayed(scr_shakeobj, 13);
            scr_script_delayed(scr_lerpvar, 16, "image_yscale", 3, 2, 6, 3, "out");
        }
    }
}
