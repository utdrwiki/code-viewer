if (con == 0)
{
    con = 1;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 1)
{
    con = 2;
    with (obj_marker)
        visible = 0;
    var bg = layer_get_all_elements(layer_get_id("BACKGROUND"));
    layer_sprite_change(bg[0], bg_church_main_disarray);
    sprite_array_size = -1;
    layerarray = layer_get_all();
    layer_set_visible("ASSETS_DEPTH_DISARRAY", true);
    for (var i = 0; i < array_length(layerarray); i++)
    {
        if (layer_get_name(layerarray[i]) == "ASSETS_DEPTH_DISARRAY")
        {
            elements = layer_get_all_elements(layerarray[i]);
            for (var j = 0; j < array_length(elements); j++)
            {
                if (layer_get_element_type(elements[j]) == 4)
                {
                    sprite_array_size++;
                    layersprite[sprite_array_size] = scr_marker(layer_sprite_get_x(elements[j]), layer_sprite_get_y(elements[j]), layer_sprite_get_sprite(elements[j]));
                    layersprite[sprite_array_size].image_xscale = layer_sprite_get_xscale(elements[j]);
                    layersprite[sprite_array_size].image_yscale = layer_sprite_get_yscale(elements[j]);
                    layersprite[sprite_array_size].image_speed = layer_sprite_get_speed(elements[j]);
                    layersprite[sprite_array_size].image_index = layer_sprite_get_index(elements[j]);
                    with (layersprite[sprite_array_size])
                        scr_depth();
                    layer_sprite_destroy(elements[j]);
                }
            }
            break;
        }
    }
    whiteall = scr_dark_marker(-10, -10, spr_pixel_white);
    whiteall.image_xscale = 999;
    whiteall.image_yscale = 999;
    whiteall.image_blend = c_black;
    whiteall.depth = 100;
    overlay = scr_marker(-10, -10, spr_whitepx_10);
    overlay.image_xscale = (room_width / 10) + 2;
    overlay.image_yscale = (room_height / 10) + 2;
    overlay.image_blend = merge_color(c_black, c_navy, 0.5);
    overlay.image_alpha = 0.4;
    overlay.depth = 990;
    c_sel(kr);
    c_setxy(396, 420);
    c_sprite(spr_kris_up_kneel_stand);
    c_sel(su);
    c_facing("susieunhappy");
    c_setxy(420, 413);
    c_sprite(spr_susie_up_kneel_stand);
    c_pannable(1);
    c_pan(260, 300, 1);
    c_mus2("initloop", "afterrain_inside.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 60);
    c_var_lerp_instance(whiteall, "image_alpha", 1, 0, 60);
    c_wait(90);
    c_sel(kr);
    c_autowalk(0);
    c_var_lerp_instance(kr_actor, "image_index", 0, 3, 18);
    c_wait(30);
    c_facing("u");
    c_halt();
    c_sel(su);
    c_autowalk(0);
    c_var_lerp_instance(su_actor, "image_index", 0, 3, 18);
    c_wait(30);
    c_facing("u");
    c_halt();
    c_wait(30);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_wait(420, 393, 20);
    c_wait(30);
    c_facing("u");
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* ..^1. Toriel?/%", "obj_ch4_LWF01_slash_Step_0_gml_101_0");
    c_talk_wait();
    c_wait(15);
    c_sel(su);
    c_sprite(spr_susie_head_down);
    c_wait(15);
    c_sel(su);
    c_sprite(spr_susie_head_down_right_more);
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* .../", "obj_ch4_LWF01_slash_Step_0_gml_117_0");
    c_msgnextloc("\\E0* ..^1. Hey^1, uh... Knight?/%", "obj_ch4_LWF01_slash_Step_0_gml_118_0");
    c_talk_wait();
    c_facing("u");
    c_wait(30);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect_wait(420, 413, 20);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* .../%", "obj_ch4_LWF01_slash_Step_0_gml_130_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_walk_head_down);
    c_addxy(0, -2);
    c_wait(15);
    c_sel(kr);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* Kris.../%", "obj_ch4_LWF01_slash_Step_0_gml_143_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_head_turn_left);
    c_addxy(0, 3);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* Was Toriel..^1. even.../", "obj_ch4_LWF01_slash_Step_0_gml_155_0");
    c_msgnextloc("\\EV* .../%", "obj_ch4_LWF01_slash_Step_0_gml_156_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_head_down);
    c_addxy(0, -1);
    c_wait(15);
    c_sprite(spr_susie_walk_right_lw_head_down);
    c_wait(15);
    c_imagespeed(0.2);
    c_walkdirect_wait(500, 413, 40);
    c_facing("d");
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EV* ..^1. let's just go./%", "obj_ch4_LWF01_slash_Step_0_gml_172_0");
    c_talk_wait();
    c_wait(15);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect(500, 700, 120);
    c_wait(90);
    c_pannable(1);
    c_pan(247, 317, 20);
    c_wait(21);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_sel(su);
    c_visible(0);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 2 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 290;
    with (obj_caterpillarchara)
        visible = 0;
    con = 10;
    with (obj_doorAny)
        instance_destroy();
}
if (con == 10 && obj_mainchara.y >= 570)
{
    con = 11;
    alarm[0] = 30;
    global.interact = 1;
    var fadein = instance_create(0, 0, obj_fadeout);
    fadein.fadespeed = 0.04;
    with (obj_mainchara)
    {
        cutscene = 1;
        fun = 1;
        vspeed = 1;
        image_speed = 0.2;
    }
}
if (con == 12)
{
    con = -1;
    global.interact = 3;
    global.entrance = (ord(string_upper("A")) - 65) + 1;
    snd_free_all();
    room_goto(room_town_church);
}
