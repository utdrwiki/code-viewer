if (con == 0 && !d_ex() && global.interact == 0)
{
    con = 1;
    global.interact = 1;
    global.facing = 2;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    bu = actor_count + 1;
    bu_actor = instance_create(burger_marker.x, burger_marker.y, obj_actor);
    scr_actor_setup(bu, bu_actor, "burgerpants");
    bu_actor.sprite_index = burger_marker.sprite_index;
    bu_actor.image_index = burger_marker.image_index;
}
if (con == 1)
{
    con = 2;
    c_var_instance(burger_marker, "visible", 0);
    c_sel(bu);
    c_autowalk(0);
    c_imagespeed(0);
    c_sel(kr);
    c_walkdirect(193, 94, 10);
    c_sel(su);
    c_walkdirect_wait(222, 87, 10);
    c_facing("u");
    c_sel(kr);
    c_facing("u");
    c_speaker("burgerpants");
    c_msgsetloc(0, "\\E1* Ahh^1, Little Buddy^1! Bet you're wondering about that date!/%", "obj_town_burgerpants_slash_Step_0_gml_43_0");
    c_talk_wait();
    c_wait(60);
    c_var_instance(id, "burger_twitch", false);
    c_sel(bu);
    c_sprite(spr_npc_burgerpants_deflate);
    c_halt();
    c_animate(0, 6, 0.2);
    c_wait(120);
    c_speaker("burgerpants");
    c_msgsetloc(0, "\\E9* She never showed up./", "obj_town_burgerpants_slash_Step_0_gml_59_0");
    c_msgnextloc("\\EB* How could I be so naive^1, little buddy?/", "obj_town_burgerpants_slash_Step_0_gml_60_0");
    c_msgnextloc("\\EB* A hot pizza babe like her^1, falling for me? What a joke./", "obj_town_burgerpants_slash_Step_0_gml_61_0");
    c_msgnextloc("\\E7* It's just that..^1. her texts seemed so..^1. real!/", "obj_town_burgerpants_slash_Step_0_gml_62_0");
    c_msgnextloc("\\E8* And the way she talked? It..^1. was honestly really cute!/", "obj_town_burgerpants_slash_Step_0_gml_63_0");
    c_msgnextloc("\\E1* And today? It suddenly got even cuter somehow!!/", "obj_town_burgerpants_slash_Step_0_gml_64_0");
    c_msgnextloc("\\E9* ..^1. haha. I'll always just be a joke^1, won't I^1, Little Buddy?/", "obj_town_burgerpants_slash_Step_0_gml_65_0");
    c_msgnextloc("\\EB* People even call me \"Pizzapants^1,\" instead of my real name.../%", "obj_town_burgerpants_slash_Step_0_gml_66_0");
    c_talk_wait();
    c_wait(15);
    c_sound_play(snd_textnoise);
    c_sel(bu);
    c_emote("note", 30, 20, 20);
    c_wait(60);
    c_sprite(spr_npc_burgerpants_stand_rain_surprise);
    c_shakeobj();
    c_speaker("burgerpants");
    c_msgsetloc(0, "\\ED* A text!?/%", "obj_town_burgerpants_slash_Step_0_gml_82_0");
    c_talk_wait();
    c_sprite(spr_npc_burgerpants_stand_rain_surprise_read);
    c_speaker("burgerpants");
    c_msgsetloc(0, "\\E7* \"Sorry I couldn't find you^1! I left a bag of...\"/", "obj_town_burgerpants_slash_Step_0_gml_89_0");
    c_msgnextloc("\\EA* \"..^1. homemade cookies near the pizza place!\"/%", "obj_town_burgerpants_slash_Step_0_gml_90_0");
    c_talk_wait();
    c_sprite(spr_npc_burgerpants_stand_rain_surprise);
    c_wait(60);
    c_sound_play(snd_grab);
    c_sel(bu);
    c_sprite(spr_npc_burgerpants_stand_rain_run);
    c_halt();
    c_shakeobj();
    c_wait(60);
    c_var_instance(id, "burger_scoot", true);
    c_sel(kr);
    c_delayfacing(30, "l");
    c_sel(su);
    c_delayfacing(30, "l");
    c_wait(120);
    c_speaker("burgerpants");
    c_msgsetloc(0, "\\ED HERE I COME^1, PIZZARINA!!!/%", "obj_town_burgerpants_slash_Step_0_gml_115_0");
    c_talk_wait();
    c_wait(15);
    c_sound_play(snd_defeatrun);
    c_var_instance(id, "burger_run", true);
    c_wait(120);
    c_sound_play(snd_defeatrun);
    c_wait(90);
    c_speaker("burgerpants");
    c_msgsetloc(0, "\\EE* IT'S REAL!!^1! COOKIES!!^1! AND THEY LOOK LIKE ME!!!/", "obj_town_burgerpants_slash_Step_0_gml_130_0");
    c_msgnextloc("\\ED* Little Buddy!!^1! You know what this means!? She's REAL!!!/%", "obj_town_burgerpants_slash_Step_0_gml_131_0");
    c_talk_wait();
    c_var_instance(id, "burger_pause", true);
    c_wait(30);
    c_var_instance(id, "burger_pause_con", 1);
    c_wait(30);
    c_speaker("burgerpants");
    c_msgsetloc(0, "\\E7* Wait a second^1! There's a message in the cookie bag!/", "obj_town_burgerpants_slash_Step_0_gml_144_0");
    c_msgnextloc("\\E7* It says.../", "obj_town_burgerpants_slash_Step_0_gml_145_0");
    c_msgnextloc("\\ED* SHE WANTS TO MEET ME AT THE FESTIVAL TOMORROW!?/", "obj_town_burgerpants_slash_Step_0_gml_146_0");
    c_msgnextloc("\\EC* Hot damn!!^1! Little Buddy!!^1! I DID IT!!!!/", "obj_town_burgerpants_slash_Step_0_gml_147_0");
    c_msgnextloc("\\EA* WAIT FOR ME^1, PIZZARINA!!!!/%", "obj_town_burgerpants_slash_Step_0_gml_148_0");
    c_talk();
    c_wait_box(2);
    c_var_instance(id, "burger_pause_con", 2);
    c_wait_box(3);
    c_var_instance(id, "burger_pause_con", 3);
    c_wait_talk();
    c_sound_play(snd_defeatrun);
    c_wait(5);
    c_var_instance(id, "burger_pause", false);
    c_var_instance(id, "burger_finish", true);
    c_wait(30);
    c_pannable(1);
    c_panobj(kr_actor, 10);
    c_wait(10);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 2 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    scr_flag_set(777, 1);
    burger_marker.sprite_index = spr_npc_burgerpants_stand_rain_empty;
    burger_marker.x = current_burger.standmarker.x;
    burger_marker.y = current_burger.standmarker.y;
    burger_marker.visible = 1;
    with (burger_marker)
        scr_depth();
    burger_readable.x = burger_marker.x + 10;
    burger_readable.y = burger_marker.y + 40;
    burger_collider.x = burger_marker.x;
    burger_collider.y = burger_marker.y + 54;
    with (burger_collider)
        image_yscale = 0.6;
    with (current_burger)
    {
        with (standmarker)
            instance_destroy();
        instance_destroy();
    }
    nicecream_npc = instance_create(374, 75, obj_npc_room);
    nicecream_npc.sprite_index = spr_npc_nicecream_phone;
    nicecream_npc.normalanim = 4;
    with (nicecream_npc)
        scr_depth();
    con = 99;
}
if (nice_con == 0 && !d_ex())
{
    nice_con = 1;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    nc = actor_count + 1;
    nc_actor = instance_create(nicecream_npc.x, nicecream_npc.y, obj_actor);
    scr_actor_setup(nc, nc_actor, "nicecream");
    nc_actor.sprite_index = nicecream_npc.sprite_index;
}
if (nice_con == 1)
{
    nice_con = 2;
    c_var_instance(nicecream_npc, "visible", 0);
    c_speaker("no_name");
    c_msgsetloc(0, "* ..^1. As long as..^1. he's happy.../%", "obj_town_burgerpants_slash_Step_0_gml_242_0");
    c_talk_wait();
    c_wait(30);
    c_sel(nc);
    c_sprite(spr_npc_nicecream_phone);
    c_emote("!", 30);
    c_wait(30);
    c_sel(nc);
    c_autowalk(0);
    c_imageindex(1);
    c_speaker("no_name");
    c_msgsetloc(0, "* Oh^1, a customer^1! Sorry^1, would love to make you some ice cream^1, but we're closed!/", "obj_town_burgerpants_slash_Step_0_gml_258_0");
    c_msgnextloc("* .../%", "obj_town_burgerpants_slash_Step_0_gml_259_0");
    c_talk();
    c_wait_box(1);
    c_sel(nc);
    c_imageindex(0);
    c_wait_talk();
    c_customfunc(function()
    {
        susie_marker.x = su_actor.x;
        susie_marker.y = su_actor.y;
        susie_marker.image_index = su_actor.image_index;
        susie_marker.sprite_index = su_actor.sprite_index;
        susie_marker.depth = su_actor.depth;
        susie_marker.visible = 1;
    });
    c_var_instance(nicecream_npc, "visible", 1);
    c_actortokris();
    c_terminatekillactors();
}
if (nice_con == 2 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    with (obj_caterpillarchara)
        visible = 1;
    with (susie_marker)
        instance_destroy();
    nice_con = 99;
}
if (burger_after_image)
{
    with (bu_actor)
        scr_afterimage();
}
if (burger_scoot)
{
    burger_scoot = false;
    if (current_burger == -4)
    {
        current_burger = instance_create(bu_actor.x, bu_actor.y, obj_burgerpants_scootintoposition);
        with (current_burger)
            scr_depth();
        bu_actor.visible = 0;
    }
}
if (burger_run)
{
    burger_run = false;
    if (current_burger != -4)
    {
        var temp_x = current_burger.x;
        var temp_y = current_burger.y;
        with (current_burger)
            instance_destroy();
        current_burger = instance_create(temp_x, temp_y, obj_burgerpants_runaway);
        with (current_burger)
            scr_depth();
    }
}
if (burger_finish)
{
    burger_finish = false;
    with (current_burger)
        con = 2;
}
if (burger_twitch)
{
    burger_twitch_timer++;
    if ((burger_twitch_timer % 2) == 0)
    {
        with (burger_marker)
            image_index = random(1.55);
        with (bu_actor)
            image_index = random(1.55);
    }
}
if (burger_pause)
{
    if (burger_pause_con == 0)
    {
        with (current_burger)
            image_speed = 0;
    }
    if (burger_pause_con == 1)
    {
        with (current_burger)
            sprite_index = spr_npc_burgerpants_stand_rain_surprise_read;
    }
    if (burger_pause_con == 2)
    {
        with (current_burger)
            sprite_index = spr_npc_burgerpants_stand_rain_surprise;
    }
    if (burger_pause_con == 3)
    {
        with (current_burger)
        {
            sprite_index = spr_npc_burgerpants_stand_rain_cookie;
            image_speed = 1;
        }
    }
}
