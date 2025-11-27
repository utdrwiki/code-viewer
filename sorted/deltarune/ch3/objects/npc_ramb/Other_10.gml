if (room == room_dw_green_room && !d_ex() && global.interact == 0)
{
    if (has_prize)
    {
        var board_flag = 1173;
        var rank_rewards = [];
        rank_rewards[0][0] = 5;
        rank_rewards[0][1] = "armor";
        rank_rewards[0][2] = 3;
        rank_rewards[1][0] = 4;
        rank_rewards[1][1] = "armor";
        rank_rewards[1][2] = 3;
        rank_rewards[2][0] = 3;
        rank_rewards[2][1] = "item";
        rank_rewards[2][2] = 2;
        rank_rewards[3][0] = 2;
        rank_rewards[3][1] = "item";
        rank_rewards[3][2] = 2;
        rank_rewards[4][0] = 1;
        rank_rewards[4][1] = "item";
        rank_rewards[4][2] = 34;
        if (global.plot >= 160)
        {
            board_flag = 1174;
            rank_rewards[0][0] = 5;
            rank_rewards[0][1] = "armor";
            rank_rewards[0][2] = 4;
            rank_rewards[1][0] = 4;
            rank_rewards[1][1] = "armor";
            rank_rewards[1][2] = 4;
            rank_rewards[2][0] = 3;
            rank_rewards[2][1] = "item";
            rank_rewards[2][2] = 28;
            rank_rewards[3][0] = 2;
            rank_rewards[3][1] = "item";
            rank_rewards[3][2] = 28;
            rank_rewards[4][0] = 1;
            rank_rewards[4][1] = "armor";
            rank_rewards[4][2] = 24;
        }
        var rank_index = scr_flag_get(board_flag);
        var rank_letter = scr_get_rank_letter(board_flag);
        var z_rank = scr_flag_get(board_flag) == 0;
        if (!z_rank)
        {
            var rank_reward_item = "";
            var rank_reward_category = "";
            for (var i = 0; i < array_length(rank_rewards); i++)
            {
                if (rank_rewards[i][0] == rank_index)
                {
                    rank_reward_item = rank_rewards[i][2];
                    rank_reward_category = rank_rewards[i][1];
                    break;
                }
            }
            var get_item_text = scr_itemget_anytype_text(rank_reward_item, rank_reward_category);
            var sentence_end = noroom ? "/" : "/%";
            scr_speaker("no_name");
            msgsetsubloc(0, "\\M1* Kris^1! Bang-up job getting ~1-rank^1, luv^1! For that^1, a little prize...~2", rank_letter, sentence_end, "obj_npc_ramb_slash_Other_10_gml_78_0");
            if (noroom)
            {
                var item_type = (rank_reward_category == "armor") ? stringsetloc("ARMORs", "obj_npc_ramb_slash_Other_10_gml_82_0_b") : stringsetloc("ITEMs", "obj_npc_ramb_slash_Other_10_gml_82_1");
                msgnextsubloc("\\M3* Ah^1, you're holding too many \\cY~1\\cW^1, luv. Get rid of something?/%", item_type, "obj_npc_ramb_slash_Other_10_gml_83_0");
            }
            else
            {
                get_prize(get_item_text);
            }
        }
        else
        {
            get_nothing();
            talked++;
            exit;
        }
    }
    else
    {
        global.msc = 1258;
        scr_text(global.msc);
        if (global.plot >= 150)
        {
            global.msc = 1306;
            scr_text(global.msc);
            if (scr_flag_get(1084) > 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "\\M1* Kris^1, games are supposed to be fun. Don't let it feel like a job^1, alright?/%", "obj_npc_ramb_slash_Other_10_gml_17_0");
            }
        }
    }
}
if (room == room_dw_changing_room)
{
    if (scr_flag_get(1029) == 0)
    {
        with (obj_room_changing_room)
            ramb_explain = true;
        talked++;
        exit;
    }
    else if (global.plot < 205)
    {
        if (scr_flag_get(1029) == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "\\M6* Ah^1, Kris. Stick around here long enough^1, and you'll learn.../", "obj_npc_ramb_slash_Other_10_gml_70_0");
            msgnextloc("\\M2* Freedom's just a thing for big shots./%", "obj_npc_ramb_slash_Other_10_gml_71_0");
        }
        if (scr_flag_get(1055) == 1)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "\\M7* Kris^1! How was it? Lots 'o fun?/", "obj_npc_ramb_slash_Other_10_gml_79_0");
                msgnextloc("\\M2* Maybe had a little extra taste of that..^1. you know?/", "obj_npc_ramb_slash_Other_10_gml_80_0");
                msgnextloc("* .../", "obj_npc_ramb_slash_Other_10_gml_81_0");
                msgnextloc("\\M4* Well^1, regardless^1, Tenna almost came in. Gotta be extra careful next time./%", "obj_npc_ramb_slash_Other_10_gml_82_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "\\M6* Come again next time^1, Kris^1, if you fancy./", "obj_npc_ramb_slash_Other_10_gml_86_0");
                msgnextloc("\\M2* All I wanna do is make sure you can play the games you want^1, Kris./%", "obj_npc_ramb_slash_Other_10_gml_87_0");
            }
        }
        if (global.plot >= 150 && global.plot < 230)
        {
            if (scr_flag_get(1029) == 1)
            {
                with (obj_room_changing_room)
                {
                    if (!ramb_is_moved)
                        ramb_move_start = true;
                    else
                        scr_flag_set(1029, 2);
                }
                scr_speaker("no_name");
                msgsetloc(0, "* I'm glad you're having REAL fun^1, Kris. It's the least I could do./", "obj_npc_ramb_slash_Other_10_gml_129_0");
                msgnextloc("\\M7* Not often a Dark World pops up in your own house^1, you know?/", "obj_npc_ramb_slash_Other_10_gml_130_0");
                msgnextloc("\\M5* ..^1. though^1, it could. If you ever wanted it to./%", "obj_npc_ramb_slash_Other_10_gml_131_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "\\M5* Sorry^1, Kris. Don't know what I was saying there./", "obj_npc_ramb_slash_Other_10_gml_136_0");
                msgnextloc("\\M0* Just go and enjoy the games^1, eh? Cheers./%", "obj_npc_ramb_slash_Other_10_gml_137_0");
            }
            if (scr_flag_get(1103) == 1)
            {
                var prev_s_rank = scr_flag_get(1173) >= 4;
                var sentence_end = prev_s_rank ? "/%" : "/";
                scr_speaker("no_name");
                msgsetloc(0, "* How was the game^1, luv...?/", "obj_npc_ramb_slash_Other_10_gml_200_0");
                msgnextloc("\\M3* ..^1. what? You couldn't finish it?/", "obj_npc_ramb_slash_Other_10_gml_201_0");
                msgnextsubloc("\\M7* Blast it. Maybe you missed something from the first stage...?~1", sentence_end, "obj_npc_ramb_slash_Other_10_gml_202_0");
                if (!prev_s_rank)
                    msgnextloc("\\M0* If only you'd gotten S-Rank earlier.../%", "obj_npc_ramb_slash_Other_10_gml_206_0");
            }
            if (scr_flag_get(1055) == 3)
            {
                if (talked == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Kris^1! How were the games? Just to your liking?/", "obj_npc_ramb_slash_Other_10_gml_146_0");
                    msgnextloc("\\M3* ..^1. What? ..^1. someone backstage with you?/", "obj_npc_ramb_slash_Other_10_gml_147_0");
                    msgnextloc("\\M6* No^1, Kris. I was back here on security the whole time./", "obj_npc_ramb_slash_Other_10_gml_148_0");
                    msgnextloc("\\M4* Tenna's really starting to stick that nose of his around^1, though./", "obj_npc_ramb_slash_Other_10_gml_149_0");
                    msgnextloc("\\M7* Sorry^1, but I think we're gonna have to make the next one the last one./%", "obj_npc_ramb_slash_Other_10_gml_150_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "\\M6* Kris^1, you sure you're feeling..^1. normal?/", "obj_npc_ramb_slash_Other_10_gml_154_0");
                    msgnextloc("\\M0* ..^1. Well^1, you are talking to a power strip. So maybe not. Haha!/%", "obj_npc_ramb_slash_Other_10_gml_155_0");
                }
            }
        }
    }
}
if (room == room_dw_tv_curtain)
{
    scr_speaker("no_name");
    msgsetloc(0, "* Kris^1, luv. Let's catch up in the Green Room.../%", "obj_npc_ramb_slash_Other_10_gml_204_0");
}
if (room == room_dw_console_room)
{
    if (scr_flag_get(1238) == 0)
    {
        with (obj_room_console_room)
            con = 10;
        exit;
    }
    else if (scr_flag_get(1066) == 0)
    {
        scr_flag_set(1066, 1);
        scr_speaker("no_name");
        msgsetloc(0, "\\M5* Kris..^1. I'm an ignorant plug. Can't say I know your motivation./", "obj_npc_ramb_slash_Other_10_gml_178_0");
        msgnextloc("\\M7* But..^1. I saw. I saw you make it^1, you know. The Fountain./", "obj_npc_ramb_slash_Other_10_gml_179_0");
        msgnextloc("\\M6* Could it be..^1. you just wanted to have fun again?/", "obj_npc_ramb_slash_Other_10_gml_180_0");
        msgnextloc("\\M2* Heh heh heh..^1. some REAL fun^1, just like the old days./", "obj_npc_ramb_slash_Other_10_gml_181_0");
        msgnextloc("* .../", "obj_npc_ramb_slash_Other_10_gml_182_0");
        msgnextloc("\\M7* That's been my purpose^1, y'know. Letting you play your games./", "obj_npc_ramb_slash_Other_10_gml_183_0");
        msgnextloc("\\M2* But^1, heh^1, now that the games are almost over.../", "obj_npc_ramb_slash_Other_10_gml_184_0");
        msgnextloc("\\M5* Makes you think^1, was it really all such a good idea?/", "obj_npc_ramb_slash_Other_10_gml_185_0");
        msgnextloc("\\M7* Your mother. Your poor mother^1, what will happen if she wakes up...?/", "obj_npc_ramb_slash_Other_10_gml_186_0");
        msgnextloc("\\M2* ..^1. ah^1, what am I doing? A power strip^1, giving YOU a lecture.../", "obj_npc_ramb_slash_Other_10_gml_187_0");
        msgnextloc("\\M0* ..^1. just play your games^1, luv./%", "obj_npc_ramb_slash_Other_10_gml_188_0");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "\\M5* Kris..^1. if not for fun^1, why'd you do it?/", "obj_npc_ramb_slash_Other_10_gml_192_0");
        msgnextloc("\\M0* ..^1. mum's the word^1, innit. Fair play^1, fair play./%", "obj_npc_ramb_slash_Other_10_gml_193_0");
    }
}
myinteract = 3;
global.typer = 6;
global.fc = 0;
global.interact = 1;
talked++;
mydialoguer = instance_create(0, 0, obj_dialoguer);
