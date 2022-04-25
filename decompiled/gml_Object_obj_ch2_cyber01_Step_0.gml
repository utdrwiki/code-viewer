if (keyboard_check_pressed(ord("P")) && scr_debug())
    audio_sound_set_track_position(global.currentsong[1], 15.67)
if (obj_mainchara.x > (x - 80) && con == -1)
{
    with (nisesweet)
        x -= 5
    with (djtable)
        x -= 5
    if (nisesweet.x <= (camerax() + 520))
        con = 10
}
if (con == 10)
{
    with (nisesweet)
        x = (camerax() + 520)
    if (obj_controller_dw_cyber_music_final.state == 3)
    {
        floattimer += 0.35
        desy = (30 + sin(floattimer))
        with (nisesweet)
        {
            if (y != other.desy)
                y = lerp(y, other.desy, 0.25)
            sprite_index = spr_sweet_dance
            image_speed = 0.25
        }
    }
    else
    {
        floattimer += 0.35
        desy = (targy + sin(floattimer))
        with (nisesweet)
        {
            if (y != other.desy)
                y = lerp(y, other.desy, 0.25)
            sprite_index = spr_sweet_idle
        }
    }
    var xpos = (nisesweet.x - 40)
    var ypos = (nisesweet.y + 64)
    with (djtable)
        x = xpos
    with (djtable)
        y = ypos
    if (djtable.x >= 2250)
        con = 20
}
if (con == 20)
{
    con = 21
    global.interact = 1
    global.facing = 1
    cutscene_master = scr_cutscene_make()
    cutscene_master.save_object[0] = id
    scr_maincharacters_actors()
    sw = 5
    sw_actor = instance_create(nisesweet.x, nisesweet.y, obj_actor)
    scr_actor_setup(sw, sw_actor, "sweet")
    sw_actor.sprite_index = spr_sweet_idle
    c_sel(sw)
    c_autowalk(false)
    nisesweet.visible = false
    hg = 6
    hg_actor = instance_create(2200, (cameray() - 80), obj_actor)
    hg_actor.y = (cameray() - 800)
    scr_actor_setup(hg, hg_actor, "hatguy")
    hg_actor.sprite_index = spr_hatguy_idle
    c_sel(hg)
    c_autowalk(false)
    nisekk.x = 2200
    nisekk.y = (cameray() - 400)
    with (nisekk)
        depth = 95000
    djtableb = scr_dark_marker((room_width + 120), 300, spr_cutscene_cyber01_dj_table_hover)
    djtableb.depth = 500000
    djtableb.image_speed = 0.25
}
if (con == 21)
{
    con = 22
    alarm[0] = 30
    c_mus2("volume", 0, 30)
    c_soundplay(snd_impact)
    c_shake()
    c_sel(sw)
    c_jump(2156, 175, 40, 10)
    c_wait(8)
    c_soundplay(snd_noise)
    c_sprite(spr_cutscene_cyber01_sweet_splat)
    c_shakeobj()
    c_wait(10)
    c_var_instance(djtable, "sprite_index", 499)
    c_var_lerp_instance(djtable, "y", djtable.y, (cameray() - 100), 30)
    c_wait(40)
    c_sprite(spr_sweet_idle)
    c_shakeobj()
    c_imagespeed(0.25)
    if shortened
    {
        c_var_instance(nisekk, "y", (cameray() - 180))
        c_var_instance(hg_actor, "y", (cameray() - 80))
        con = 99
        tempcon = 0
        c_waitcustom()
    }
    else
    {
        c_mus2("initloop", "music_guys_intro.ogg", 0)
        c_msgside("bottom")
        scr_miniface_init_sweet()
        c_speaker("no_name")
        c_msgsetloc(0, "\\m1		*D-dead end...!/%", "obj_ch2_cyber01_slash_Step_0_gml_83_0")
        c_talk_wait()
        c_var_instance(nisekk, "y", (cameray() - 180))
        c_var_instance(hg_actor, "y", (cameray() - 80))
        c_sel(kr)
        c_walkdirect(2080, 182, 15)
        c_delayfacing(16, "r")
        c_sel(su)
        c_walkdirect(2105, 220, 15)
        c_delayfacing(16, "r")
        c_sel(ra)
        c_walkdirect(2039, 130, 15)
        c_delayfacing(16, "r")
        c_sel(sw)
        c_walk("r", 4, 15)
        c_wait(30)
        scr_smallface(0, "ralsei", 19, "left", "bottom", stringsetloc("Oh, like \"suite?\"", "obj_ch2_cyber01_slash_Step_0_gml_104_0"))
        scr_smallface(1, "susie", 11, "right", "bottom", stringsetloc("Oh, like... sweets?", "obj_ch2_cyber01_slash_Step_0_gml_105_0"))
        c_speaker("susie")
        c_msgsetloc(0, "\\E5* Alright^1, what's the deal^1, twerp!/", "obj_ch2_cyber01_slash_Step_0_gml_108_0")
        c_facenext("no_name", 0)
        c_msgnextloc("\\m1		*Who's a twerp!? The name's&	Sweet!\\f0\\f1/%", "obj_ch2_cyber01_slash_Step_0_gml_110_0")
        c_talk_wait()
        c_sel(sw)
        c_sprite(spr_sweet_dance)
        c_imagespeed(0.25)
        c_speaker("no_name")
        c_msgsetloc(0, "\\m1		*Don't tell me you haven't&	heard of the Sweet Cap'n&	Cakes?!?/", "obj_ch2_cyber01_slash_Step_0_gml_118_0")
        c_facenext("ralsei", "J")
        c_msgnextloc("\\EJ* Um^1, doesn't ring a bell.../%", "obj_ch2_cyber01_slash_Step_0_gml_120_0")
        c_talk_wait()
        c_sel(sw)
        c_sprite(spr_sweet_hurt)
        c_shakeobj()
        c_soundplay(snd_wing)
        c_wait(5)
        c_speaker("no_name")
        c_msgsetloc(0, "\\m1		*G-Guess our act's still a bit&	underground.../%", "obj_ch2_cyber01_slash_Step_0_gml_129_0")
        c_talk_wait()
        c_sel(sw)
        c_sprite(spr_sweet_dance)
        c_imagespeed(0.25)
        c_speaker("no_name")
        c_msgsetloc(0, "\\m1		*Sweet Cap'n Cakes^1! Not only&	are we Cyber Field's BEST&	musical trio.../", "obj_ch2_cyber01_slash_Step_0_gml_137_0")
        c_msgnextloc("\\m1		*We're also the last resistance&	against the big bad Queen and&	all her crew!/", "obj_ch2_cyber01_slash_Step_0_gml_138_0")
        c_msgnextloc("\\m1		*And that starts with resisting&	YOU!/%", "obj_ch2_cyber01_slash_Step_0_gml_139_0")
        c_talk_wait()
        c_sprite(spr_sweet_idle)
        c_sel(su)
        c_sprite(spr_cutscene_09_susie_exasperated)
        c_shakeobj()
        c_speaker("susie")
        c_msgsetloc(0, "\\EH* What!? We're fighting Queen^1, too!/", "obj_ch2_cyber01_slash_Step_0_gml_151_0")
        c_facenext("no_name", 0)
        c_msgnextloc("\\m1		*Nuh-uh-uh^1! Cap'n saw you help&	her kidnap some girl!/", "obj_ch2_cyber01_slash_Step_0_gml_153_0")
        c_msgnextloc("\\m1		*Hey^1! Hey^1, Cap!/%", "obj_ch2_cyber01_slash_Step_0_gml_154_0")
        c_talk_wait()
        c_sel(sw)
        c_autowalk(false)
        c_imagespeed(0.25)
        c_walk("l", 10, 10)
        c_sel(hg)
        c_imagespeed(0.25)
        c_soundplay(snd_lancerwhistle)
        c_walkdirect_wait(2200, 110, 15)
        c_soundplay(snd_impact)
        c_shake()
        c_sel(kr)
        c_autofacing(0)
        c_walk("l", 6, 10)
        c_sel(ra)
        c_autofacing(0)
        c_walk("l", 6, 10)
        c_sel(su)
        c_facing("r")
        c_autofacing(0)
        c_walk("l", 6, 10)
        c_speaker("no_name")
        c_msgsetloc(0, "\\m3		*We won't let anyone lay a&	finger on madamoizels.../%", "obj_ch2_cyber01_slash_Step_0_gml_170_0")
        c_talk_wait()
        c_sel(sw)
        c_sprite(spr_cutscene_cyber01_sweet_splat)
        c_soundplay(snd_wing)
        c_shakeobj()
        c_speaker("no_name")
        c_msgsetloc(0, "\\m3		*Except us^2!&\\m1	That's not the point^1, Cap'n!!/%", "obj_ch2_cyber01_slash_Step_0_gml_179_0")
        c_talk_wait()
        c_sel(hg)
        c_flip("x")
        c_speaker("no_name")
        c_msgsetloc(0, "\\m3		*It's like half the point. 60`%?&	55..^2.&\\m1	We're rebels^1, not players!/%", "obj_ch2_cyber01_slash_Step_0_gml_186_0")
        c_talk_wait()
        c_sel(hg)
        c_flip("x")
        c_speaker("no_name")
        c_msgsetloc(0, "\\m3		*We're rebels that play^2.&\\m1	We don't play!^1! We don't&	play!!/", "obj_ch2_cyber01_slash_Step_0_gml_193_0")
        c_msgnextloc("\\m3		*That's it!^1! K_K!!^1! Get over&	here!!/%", "obj_ch2_cyber01_slash_Step_0_gml_194_0")
        c_talk_wait()
        c_sel(sw)
        c_sprite(spr_sweet_idle)
        c_imagespeed(0.25)
        c_walk("l", 4, 10)
        c_sel(hg)
        c_imagespeed(0.25)
        c_walk_wait("l", 4, 10)
        c_sel(sw)
        c_flip("x")
        c_imagespeed(0.25)
        c_sel(hg)
        c_flip("x")
        c_imagespeed(0.25)
        c_var_lerp_instance(nisekk, "y", nisekk.y, 175, 15)
        c_wait(15)
        c_soundplay(snd_impact)
        c_shake()
        c_wait(30)
        c_speaker("no_name")
        c_msgsetloc(0, "\\m3		*K_K^1, are we players!^2?&\\m2	.../", "obj_ch2_cyber01_slash_Step_0_gml_223_0")
        c_msgnextloc("\\m2		*I'm a CD player./%", "obj_ch2_cyber01_slash_Step_0_gml_224_0")
        c_talk_wait()
        c_mus("pause")
        c_mus2("initloop", "music_guys.ogg", 0)
        c_sel(sw)
        c_sprite(spr_sweet_dance)
        c_imagespeed(0.25)
        c_sel(hg)
        c_sprite(spr_hatguy_dance)
        c_imagespeed(0.25)
        c_var_instance(nisekk, "dancing", 1)
        c_wait(60)
        c_sel(kr)
        c_sel(ra)
        c_emote("...", 30)
        c_sel(su)
        c_emote("...", 30)
        c_wait(60)
        c_sel(kr)
        c_facing("l")
        c_delaywalk(16, "l", 1, 80)
        c_sel(ra)
        c_facing("l")
        c_delaywalk(16, "l", 1, 80)
        c_sel(su)
        c_facing("l")
        c_delaywalk(16, "l", 1, 80)
        c_wait(80)
        c_sel(sw)
        c_flip("x")
        c_sprite(spr_sweet_hurt)
        c_imagespeed(0)
        c_sel(kr)
        c_halt()
        c_sel(ra)
        c_halt()
        c_sel(su)
        c_halt()
        c_speaker("no_name")
        c_msgsetloc(0, "\\m1		*Wait^1! They're getting away!/%", "obj_ch2_cyber01_slash_Step_0_gml_279_0")
        c_talk_wait()
        c_sel(sw)
        c_sprite(spr_sweet_idle)
        c_imagespeed(0.25)
        c_sel(kr)
        c_facing("r")
        c_sel(ra)
        c_facing("r")
        c_sel(su)
        c_facing("r")
        c_sel(hg)
        c_imagespeed(0.25)
        c_flip("x")
        c_sprite(spr_hatguy_idle)
        c_wait(10)
        c_speaker("no_name")
        c_msgsetloc(0, "\\m3		*Sweet^1, chill. There'll be&	other bad guys^2!&\\m1	No^1, this is our chance!/", "obj_ch2_cyber01_slash_Step_0_gml_301_0")
        c_msgnextloc("\\m1		*Are you ready!? Let's fight!!/%", "obj_ch2_cyber01_slash_Step_0_gml_302_0")
        c_talk_wait()
        c_wait(90)
        c_sel(sw)
        c_flip("x")
        c_sel(hg)
        c_flip("x")
        c_speaker("no_name")
        c_msgsetloc(0, "\\m3		*..^1. K_K.&\\m2	Yeah?/", "obj_ch2_cyber01_slash_Step_0_gml_336_0")
        c_msgnextloc("\\m1		*Play some battle music^2!&\\m2	OK^2!/%", "obj_ch2_cyber01_slash_Step_0_gml_337_0")
        c_talk_wait()
        c_sel(sw)
        c_flip("x")
        c_sel(hg)
        c_flip("x")
        c_mus("stop")
        c_mus("free_all")
        c_var_instance(nisekk, "dancing", 0)
        c_waitcustom()
    }
}
if (tempcon == 0 && customcon == 1)
{
    tempcon = 1
    con = 23
}
if (con == 23 && customcon == 1)
{
    with (obj_actor)
        visible = false
    con = 29
    alarm[0] = 30
    if (global.tempflag[27] == 0)
        global.tempflag[27] = 1
    var sweet_marker = scr_dark_marker(sw_actor.x, sw_actor.y, sw_actor.sprite_index)
    var hg_marker = scr_dark_marker(hg_actor.x, hg_actor.y, hg_actor.sprite_index)
    var kk_marker = instance_create(x, y, obj_marker)
    kk_marker_fake = scr_dark_marker(((room_width - 442) + 92), ((room_height - 176) - 109), nisekk.sprite_index)
    nisekk.visible = false
    encounterflag = 552
    global.flag[54] = encounterflag
    obj_mainchara.cutscene = true
    obj_mainchara.x = kr_actor.x
    obj_mainchara.y = kr_actor.y
    global.cinstance[0].x = su_actor.x
    global.cinstance[0].y = su_actor.y
    global.cinstance[1].x = ra_actor.x
    global.cinstance[1].y = ra_actor.y
    global.flag[9] = 2
    global.batmusic[0] = -1
    snd_init("spamton_neo_mix_ex_wip.ogg")
    scr_battle(62, true, sweet_marker, kk_marker, hg_marker)
    with (kk_marker_fake)
    {
        scr_move_to_point_over_time((camerax() + 520), (cameray() + 110), 20)
        __doom = instance_create(x, y, obj_doom)
        __doom.target = id
        __doom.alarm[0] = 25
    }
}
if (con == 30 && i_ex(obj_battlecontroller))
{
    var battle_end = 0
    with (obj_battlecontroller)
    {
        if (intro == 2)
            battle_end = 1
    }
    if battle_end
    {
        con = 32
        nisekk.visible = true
        snd_volume(global.batmusic[1], 0, 25)
    }
}
if (con == 32)
{
    con = 34
    customcon = 0
    kr_actor.x = obj_herokris.x
    kr_actor.y = obj_herokris.y
    kr_actor.sprite_index = spr_krisr_dark
    su_actor.x = obj_herosusie.x
    su_actor.y = obj_herosusie.y
    su_actor.sprite_index = spr_susie_walk_right_dw
    ra_actor.x = obj_heroralsei.x
    ra_actor.y = obj_heroralsei.y
    ra_actor.sprite_index = spr_ralsei_walk_right
    sw_actor.x = obj_sweet_enemy.x
    sw_actor.y = obj_sweet_enemy.y
    sw_actor.sprite_index = obj_sweet_enemy.sprite_index
    hg_actor.x = obj_hatguy_enemy.x
    hg_actor.y = obj_hatguy_enemy.y
    hg_actor.sprite_index = spr_hatguy_idle
    nisekk.x = obj_kk_enemy.x
    nisekk.y = obj_kk_enemy.y
    nisekk.dancing = true
    with (nisekk)
        scr_depth()
    with (obj_actor)
        visible = true
    with (obj_mainchara)
        visible = false
    with (obj_caterpillarchara)
        visible = false
    snd_free(global.batmusic[0])
    with (obj_monsterparent)
        instance_destroy()
    with (obj_bulletparent)
        instance_destroy()
    with (obj_heroparent)
        instance_destroy()
    with (obj_marker)
        instance_destroy()
    if i_ex(obj_battleback)
    {
        with (obj_battleback)
            destroy = 1
    }
    if i_ex(obj_battlecontroller)
        instance_destroy(obj_battlecontroller)
}
if (con == 34 && (!i_ex(obj_battlecontroller)))
{
    con = 35
    global.interact = 1
    with (obj_actor)
        visible = true
    with (obj_mainchara)
        visible = false
    with (obj_caterpillarchara)
        visible = false
    c_mus2("initloop", "music_guys_intro.ogg", 0)
    c_waitcustom_end()
    c_pannable(true)
}
if (con == 35)
{
    con = 49
    if (!i_ex(obj_battlecontroller))
        global.fighting = false
    alarm[0] = 30
    if (!i_ex(djtableb))
    {
        djtableb = scr_dark_marker((room_width + 120), 300, spr_cutscene_cyber01_dj_table_hover)
        djtableb.depth = 500000
        djtableb.image_speed = 0.25
    }
    cutscene_master.save_object[1] = nisekk
    cutscene_master.save_object[2] = djtableb
    c_sel(kr)
    c_autowalk(false)
    c_walkdirect(1960, 116, 15)
    c_delayfacing(16, "r")
    c_sel(su)
    c_autowalk(false)
    c_walkdirect(2003, 145, 15)
    c_delayfacing(16, "r")
    c_sel(ra)
    c_autowalk(false)
    c_walkdirect(1961, 210, 15)
    c_delayfacing(16, "r")
    c_sel(sw)
    c_autowalk(false)
    c_walkdirect(2145, 85, 15)
    c_sel(hg)
    c_autowalk(false)
    c_walkdirect(2262, 221, 15)
    c_var_lerp_instance(nisekk, "y", nisekk.y, 167, 15)
    c_var_lerp_instance(nisekk, "x", nisekk.x, 2120, 15)
    scr_miniface_init_sweet()
    c_msgside("bottom")
    c_speaker("sweet")
    c_msgsetloc(0, "\\m1		*Feel the beat^2!&\\m3	Watch my moves^2!&\\m2	Dance^1, dance!!/", "obj_ch2_cyber01_slash_Step_0_gml_538_0")
    c_facenext("susie", "2")
    c_msgnextloc("\\E2* Hey^1, losers!^1! Wrap it up!^1! Battle's over!!/%", "obj_ch2_cyber01_slash_Step_0_gml_540_0")
    c_talk()
    c_wait_box(1)
    c_sel(su)
    c_sprite(spr_susie_point_right)
    c_addxy(8, 58)
    c_shakeobj()
    c_wait_talk()
    c_addxy(-8, -58)
    c_facing("r")
    c_var_instance(nisekk, "dancing", 0)
    c_sel(sw)
    c_emote("!", 30)
    c_imagespeed(0)
    c_sel(hg)
    c_emote("!", 30)
    c_imagespeed(0)
    c_wait(30)
    c_sel(sw)
    c_sprite(spr_sweet_idle)
    c_imagespeed(0.25)
    c_sel(hg)
    c_sprite(spr_hatguy_idle)
    c_imagespeed(0.25)
    c_wait(10)
    scr_smallface(0, "susie", 17, "left", "bottom", stringsetloc("WE ARE the good side!!!", "obj_ch2_cyber01_slash_Step_0_gml_566_0"))
    scr_smallface(1, "ralsei", 26, 300, "bottom", stringsetloc("Just go with it, Susie...", "obj_ch2_cyber01_slash_Step_0_gml_567_0"))
    c_speaker("k_k")
    c_msgsetloc(0, "\\m2		*Over^2?&\\m3	In other-type words...&\\m1	We lost!?/", "obj_ch2_cyber01_slash_Step_0_gml_570_0")
    c_msgnextloc("\\m1		*..^2.&\\m3	..^2.&\\m2	.../", "obj_ch2_cyber01_slash_Step_0_gml_571_0")
    c_msgnextloc("\\m2		*Does that mean we can be&	friends^2?&\\m1	K_K!^1! No!!/", "obj_ch2_cyber01_slash_Step_0_gml_572_0")
    c_msgnextloc("\\m3		*Fighting's not really my style&	anyways..^2.&\\m1	Yeah^1! Because you're a coward!/", "obj_ch2_cyber01_slash_Step_0_gml_573_0")
    c_msgnextloc("\\m1		*..^1. I mean^1, it was fun&	dancing^1, but..^2.&\\m2	Sweet. Don't worry./", "obj_ch2_cyber01_slash_Step_0_gml_574_0")
    c_msgnextloc("\\m2		*I think our dancing beat them^2.&\\m1	Beat them...^2?&\\m3	Yeah^1, all mercy-like./", "obj_ch2_cyber01_slash_Step_0_gml_575_0")
    c_msgnextloc("\\m3		*See^1, when we danced with them^1,&	it convinced them we're cool^2.&\\m1	Now they're on our side?/", "obj_ch2_cyber01_slash_Step_0_gml_576_0")
    c_msgnextloc("\\m2		*Yes./", "obj_ch2_cyber01_slash_Step_0_gml_577_0")
    c_msgnextloc("\\m1		*Hey!^1! You three!^1! Welcome to&	the good side!!\\f0\\f1/", "obj_ch2_cyber01_slash_Step_0_gml_578_0")
    c_msgnextloc("\\m3		*Let's ronday-voo at our Junk&	Shop..^2./", "obj_ch2_cyber01_slash_Step_0_gml_579_0")
    c_msgnextloc("\\m1		*We jammed the door shut^1, but&	we'll kick it open!/", "obj_ch2_cyber01_slash_Step_0_gml_580_0")
    c_msgnextloc("\\m3		*Alright everyone^1, let's go!/%", "obj_ch2_cyber01_slash_Step_0_gml_581_0")
    c_sel(sw)
    c_sprite(spr_cutscene_cyber01_sweet_splat)
    c_soundplay(snd_wing)
    c_shakeobj()
    c_talk()
    c_wait_box(2)
    c_sel(sw)
    c_sprite(spr_sweet_idle)
    c_flip("x")
    c_wait_box(3)
    c_sel(hg)
    c_flip("x")
    c_wait_box(8)
    c_sel(sw)
    c_flip("x")
    c_sprite(spr_sweet_dance)
    c_sel(hg)
    c_flip("x")
    c_wait_talk()
    c_var_lerp_instance(djtableb, "x", djtableb.x, 2216, 15)
    c_var_lerp_instance(djtableb, "y", djtableb.y, 260, 15)
    c_wait(10)
    c_sel(sw)
    c_autowalk(false)
    c_walkdirect(2235, 188, 10)
    c_sel(hg)
    c_autowalk(false)
    c_walkdirect_wait(2274, 197, 10)
    c_var_instance(nisekk, "depth", 10000)
    c_var_lerp_instance(nisekk, "x", 2120, 2226, 15)
    c_var_lerp_instance(nisekk, "y", 167, 71, 15)
    c_wait(45)
    c_wait(10)
    c_mus("stop")
    c_mus2("initloop", "music_guys.ogg", 0)
    c_wait(10)
    c_var_lerp_instance(sw_actor, "vspeed", 0, -10, 60)
    c_var_lerp_instance(hg_actor, "vspeed", 0, -10, 60)
    c_var_lerp_instance(nisekk, "vspeed", 0, -10, 60)
    c_var_lerp_instance(djtableb, "vspeed", 0, -10, 60)
    c_mus2("volume", 0, 90)
    c_wait(60)
    c_sel(su)
    c_autowalk(true)
    c_facing("r")
    c_walkdirect(2005, 102, 30)
    c_delayfacing(31, "l")
    c_sel(ra)
    c_autowalk(true)
    c_facing("r")
    c_walkdirect(2057, 107, 30)
    c_delayfacing(31, "l")
    c_pannable(true)
    c_panobj(kr_actor, 30)
    c_wait(35)
    c_pannable(false)
    c_mus("free_all")
    c_actortokris()
    c_actortocaterpillar()
    c_terminatekillactors()
}
if (con == 50 && (!i_ex(obj_cutscene_master)))
{
    snd_free_all()
    con = 0
    global.interact = 0
    global.encounterno = 52
    global.facing = 0
    global.plot = 60
    global.flag[34] = 0
}
