event_inherited();
if (board_talk && !d_ex() && global.interact == 0)
{
    board_talk = false;
    global.interact = 1;
    board_con = 1;
    board_talk_count++;
    scr_speaker("no_name");
    msgsetloc(0, "\\M2* Time flies..^1. Seems like just yesterday you and that girl had everyone here lined up./", "obj_npc_ramb_slash_Step_0_gml_15_0");
    msgnextloc("* Queen on her side^1, King on your side^1, Tenna in back..^1. Oh^1, it was chaos^1, CHAOS!/", "obj_npc_ramb_slash_Step_0_gml_16_0");
    msgnextloc("\\M0* Heh^1, only kids like you two would take a laptop home just to play make believe./", "obj_npc_ramb_slash_Step_0_gml_17_0");
    msgnextloc("\\M1* ..^1. how is she^1, Kris? Are you two...? Well^1, it's alright. Everyone changes. 'cept us./%", "obj_npc_ramb_slash_Step_0_gml_18_0");
    if (board_talk_count > 1)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Kris^1, luv^1, don't you got better to do than talking to little ol' me?/%", "obj_npc_ramb_slash_Step_0_gml_40_0");
    }
    d_make();
}
if (board_con == 1 && !d_ex() && global.interact == 1)
{
    global.interact = 0;
    board_con = 99;
}
if (get_prize_sequence)
{
    if (get_prize_con == 0 && !d_ex())
    {
        global.interact = 1;
        get_prize_con = 1;
        scr_var_delay("get_prize_con", 2, 30);
        snd_play(snd_item);
        with (prize_marker)
            instance_destroy();
    }
    if (get_prize_con == 2 && !d_ex())
    {
        get_prize_con = 3;
        scr_speaker("no_name");
        msgset(0, prize_text);
        d_make();
    }
    if (get_prize_con == 3 && !d_ex())
    {
        global.interact = 0;
        get_prize_con = -1;
        get_prize_sequence = false;
        has_prize = false;
        scr_flag_set(prize_flag, 1);
    }
    if (get_prize_con == 10 && !d_ex())
    {
        global.interact = 1;
        get_prize_con = 11;
        scr_speaker("no_name");
        msgsetloc(0, "\\M1* Kris^1! Your rank..^1. Z-Rank. Well^1, I suppose you gave it a good try!/", "obj_npc_ramb_slash_Step_0_gml_95_0");
        msgnextloc("* Here^1, the gift.../%", "obj_npc_ramb_slash_Step_0_gml_96_0");
        d_make();
    }
    if (get_prize_con == 11 && !d_ex())
    {
        get_prize_con = 12;
        scr_var_delay("get_prize_con", 13, 30);
        snd_play(snd_item);
        with (prize_marker)
            instance_destroy();
    }
    if (get_prize_con == 13)
    {
        get_prize_con = 14;
        scr_speaker("no_name");
        msgsetloc(0, "* (The giftbox was empty.)/", "obj_npc_ramb_slash_Step_0_gml_118_0");
        msgnextloc("\\M1* That's right^1, Kris. Tenna's not too keen on that behavior.../", "obj_npc_ramb_slash_Step_0_gml_119_0");
        msgnextloc("\\M2* Reminds him of a certain..^1. y'know./", "obj_npc_ramb_slash_Step_0_gml_120_0");
        msgnextloc("\\M2* ..^1. that's why HIS game's a bit of a bust^1, y'see?/", "obj_npc_ramb_slash_Step_0_gml_121_0");
        msgnextloc("\\M0* (Just wait..^1. I'll show you something electrifying^1, I will...)/%", "obj_npc_ramb_slash_Step_0_gml_122_0");
        d_make();
    }
    if (get_prize_con == 14 && !d_ex())
    {
        global.interact = 0;
        get_prize_con = -1;
        get_prize_sequence = false;
        has_prize = false;
        scr_flag_set(prize_flag, 2);
    }
}
if (room == room_dw_green_room && global.flag[20] == 0)
    body_anim += 0.1;
if (!d_ex() && global.interact == 0)
{
    global.flag[20] = 0;
    head_sprite = head_sprite_default;
    head_sprite_index = 0;
    current_state = global.flag[20];
}
if (global.flag[20] == current_state)
    exit;
if (!load_sprite)
{
    load_sprite = true;
    anim_timer = 0;
    head_sprite = head_sprites[global.flag[20]];
    head_sprite_index = 0;
}
if (load_sprite)
{
    anim_timer++;
    head_sprite_index += 0.3;
    if (head_sprite_index > 3)
    {
        load_sprite = false;
        current_state = global.flag[20];
    }
}
