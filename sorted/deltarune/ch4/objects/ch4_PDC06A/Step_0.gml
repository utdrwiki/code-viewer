if (con == 99 && scr_flag_get(710) == 1)
{
    if (leave_con == 0 && obj_mainchara.x >= 1800)
        leave_con = 1;
    if (leave_con == 1)
    {
        leave_con++;
        global.interact = 1;
        obj_mainchara.x = 1794;
        scr_speaker("no_name");
        msgsetloc(0, "* (Your friends are still in Ralsei's room...)/%", "obj_ch4_PDC06A_slash_Step_0_gml_18_0");
        d_make();
    }
    if (leave_con == 2 && !d_ex())
    {
        leave_con = 0;
        global.interact = 0;
        global.facing = 0;
    }
}
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 2)
{
    con = 3;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_pannable(1);
    c_panspeed(-4, 0, 20);
    c_sel(kr);
    c_facing("l");
    c_sel(su);
    c_facing("l");
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walkdirect(745, 251, 15);
    c_sel(ra);
    c_facing("l");
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walkdirect_wait(787, 217, 15);
    c_halt();
    c_sel(su);
    c_halt();
    c_wait(30);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Hey^1, what's that room over there? Your room?/", "obj_ch4_PDC06A_slash_Step_0_gml_77_0");
    c_facenext("ralsei", 26);
    c_msgnextloc("\\EQ* Err..^1. Sorry^1, it's still really dusty and dirty^1, s-so...!/", "obj_ch4_PDC06A_slash_Step_0_gml_79_0");
    c_facenext("susie", 20);
    c_msgnextloc("\\EK* ..^1. So what?/", "obj_ch4_PDC06A_slash_Step_0_gml_81_0");
    c_facenext("ralsei", "K");
    c_msgnextloc("\\EK* So you can't^1, er^1, go inside. Until I clean it./%", "obj_ch4_PDC06A_slash_Step_0_gml_83_0");
    c_talk();
    c_wait_box(3);
    c_sel(su);
    c_facing("u");
    c_wait_box(5);
    c_sel(ra);
    c_facing("d");
    c_wait_talk();
    c_wait(60);
    c_sel(su);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* C'mon^1, what are you hiding that's that embarassing!?/", "obj_ch4_PDC06A_slash_Step_0_gml_103_0");
    c_msgnextloc("\\E7* Last one there's a fresh egg!/%", "obj_ch4_PDC06A_slash_Step_0_gml_104_0");
    c_talk();
    c_wait_box(1);
    c_mus("free_all");
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_left);
    c_shakeobj();
    c_sel(su);
    c_autowalk(1);
    c_walkdirect(455, 251, 15);
    c_delaywalkdirect(16, 455, 185, 10);
    c_wait(5);
    c_var_instance(tape_npc, "sprite_index", spr_cautiontape_ralsei_castle_broken);
    c_soundplay(snd_noise);
    c_wait(12);
    c_soundplay(snd_dooropen);
    c_var_instance(door_marker, "visible", 1);
    c_wait(6);
    c_var_instance(id, "susie_hide", true);
    c_wait_talk();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EC* S-Susie^1, w..^1. wait!/%", "obj_ch4_PDC06A_slash_Step_0_gml_137_0");
    c_talk();
    c_sel(ra);
    c_autowalk(1);
    c_walkdirect_wait(461, 217, 20);
    c_walkdirect(461, 185, 10);
    c_wait(3);
    c_var_instance(id, "ralsei_hide", true);
    c_wait_talk();
    c_sel(ra);
    c_visible(0);
    c_sel(su);
    c_visible(0);
    c_wait(5);
    c_soundplay(snd_doorclose);
    c_var_instance(door_marker, "visible", 0);
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    scr_flag_set(710, 1);
    with (tape_collider)
        instance_destroy();
    with (tape_readable)
        instance_destroy();
    with (obj_caterpillarchara)
        fun = 1;
    con = 99;
    leave_con = 0;
    scr_losechar();
    with (obj_readable_room1)
    {
        if (extflag == "tv_closed")
            instance_destroy();
    }
    with (obj_doorAny)
    {
        if (x >= 1220)
        {
            if (x < 1720)
            {
                var readable = instance_create(x, y, obj_readable_room1);
                readable.image_xscale = image_xscale * 2;
                readable.image_yscale = image_yscale * 2;
            }
            var block = instance_create(x, y, obj_solidblockDark);
            block.image_xscale = image_xscale;
            block.image_yscale = image_yscale + 0.25;
        }
    }
}
if (susie_hide)
{
    susie_shadow = clamp(susie_shadow + 0.2, 0, 1);
    var shadow = susie_shadow;
    with (su_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (susie_shadow >= 1)
        susie_hide = false;
}
if (ralsei_hide)
{
    ralsei_shadow = clamp(ralsei_shadow + 0.2, 0, 1);
    var shadow = ralsei_shadow;
    with (ra_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (ralsei_shadow >= 1)
        ralsei_hide = false;
}
