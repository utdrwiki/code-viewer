var gamebeaten = 0;
if (file_exists("filech3_3") || file_exists("filech3_4") || file_exists("filech3_5"))
    gamebeaten = 1;
if (buffer < 0 && init && !i_ex(obj_chaseenemy_board) && !i_ex(obj_quizchaser) && !i_ex(obj_gameshow_battlemanager))
{
    myinteract = 3;
    global.interact = 1;
    if (animate)
        image_index = 1;
    scr_speaker("no_name");
    msgsetloc(0, "HELLO AND WELCOME TO THE TEST NPC./", "obj_board_npc_slash_Other_10_gml_14_0");
    msgnextloc("I HOPE THAT YOU HAVE A NICE DAY./%", "obj_board_npc_slash_Other_10_gml_15_0");
    if (extflag == "intro")
    {
        if (obj_board_event_bigdoor.dooropened == true || obj_board_inventory.keycount >= 4 || obj_board_inventory.sunmoonstone == true)
            read = 1;
        if (read == 0)
        {
            msgsetloc(0, "WELCOME TO THE BOARD GAME GAME BOARD!/", "obj_board_npc_slash_Other_10_gml_27_0");
            msgnextloc("TO WIN THE GAME^1, ENTER THE PYRAMID AND FACE THE FINAL CHALLENGE./", "obj_board_npc_slash_Other_10_gml_28_0");
            msgnextloc("HOWEVER^1, THE WAY IS LOCKED BY 3 KEYS AND MOONCLOUD STONE./", "obj_board_npc_slash_Other_10_gml_29_0");
            msgnextloc("GOOD LUCK!/%", "obj_board_npc_slash_Other_10_gml_30_0");
        }
        else
        {
            msgsetloc(0, "FIND THREE KEYS AND THE MOONCLOUD STONE TO OPEN THE DOOR!/%", "obj_board_npc_slash_Other_10_gml_35_0");
            if (i_ex(obj_board_inventory))
            {
                if (obj_board_inventory.keycount >= 3)
                {
                    msgsetloc(0, "YOU FOUND THE KEYS FOLKS^1! APPLAUSE SIGNS^1, APPLAUSE SIGNS!/", "obj_board_npc_slash_Other_10_gml_41_0");
                    msgnextloc("BUT^1, CAN YOU FIND MOONCLOUD STONE?/%", "obj_board_npc_slash_Other_10_gml_42_0");
                }
                if (obj_board_inventory.keycount >= 3 && obj_board_inventory.sunmoonstone == true)
                {
                    msgsetloc(0, "WHAT!? YOU ALREADY FOUND EVERYTHING!?/", "obj_board_npc_slash_Other_10_gml_46_0");
                    msgnextloc("THAT WAS FAST..^1. HA^1, HA. YOU DESERVE APPLAUSE FOR THAT ONE!/%", "obj_board_npc_slash_Other_10_gml_47_0");
                }
            }
            if (i_ex(obj_board_event_bigdoor))
            {
                if (obj_board_event_bigdoor.dooropened == true)
                    msgsetloc(0, "THE DOOR'S OPEN!^1! WHAT ARE YOU TALKING TO ME FOR?/%", "obj_board_npc_slash_Other_10_gml_55_0");
            }
        }
    }
    if (extflag == "b1oasis_1")
    {
        var ver = 0;
        if (obj_b1spring.con >= 4)
            ver = 1;
        if (global.flag[1079] == 1)
            ver = 2;
        scr_speaker("pippins");
        if (ver == 0)
        {
            msgsetloc(0, "THIS IS THE RESERVOIR FOR THE OASIS./", "obj_board_npc_slash_Other_10_gml_73_0");
            msgnextloc("AND^1, IN THE OASIS IS A SECRET STONE.../%", "obj_board_npc_slash_Other_10_gml_74_0");
        }
        if (ver == 1)
        {
            msgsetloc(0, "THE RESERVOIR IS CLUGGED WITH STONE./", "obj_board_npc_slash_Other_10_gml_79_0");
            msgnextloc("NOW^1, WHAT HAPPENS TO OASIS?/%", "obj_board_npc_slash_Other_10_gml_80_0");
        }
        if (ver == 2)
        {
            msgsetloc(0, "ALL THE WATER IN THE WORLD WAS SUCKED./", "obj_board_npc_slash_Other_10_gml_85_0_b");
            msgnextloc("OH.../%", "obj_board_npc_slash_Other_10_gml_86_0_b");
        }
    }
    if (extflag == "elnina1")
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "OH^1, MY OASIS^1! MY OASIS!/", "obj_board_npc_slash_Other_10_gml_68_0");
            msgnextloc("WITH THE SUNNY MOON\nREFLECTED IN THE WATER/", "obj_board_npc_slash_Other_10_gml_69_0");
            msgnextloc("THIS IS THE PERFECT\nFORECAST FOR LOVE!/%", "obj_board_npc_slash_Other_10_gml_70_0");
            with (obj_b1oasis)
            {
                if (talkcon == 0)
                {
                    talkcon = 10;
                    talker = other.extflag;
                }
            }
        }
        if (read > 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "AS LONG AS THE OASIS\nSHINES^1,/", "obj_board_npc_slash_Other_10_gml_75_0");
            msgnextloc("THE WEATHER\nALWAYS STICKS TOGETHER!/%", "obj_board_npc_slash_Other_10_gml_64_0");
        }
    }
    if (extflag == "lanino1")
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "OH^1, MY OASIS^1! MY OASIS!/", "obj_board_npc_slash_Other_10_gml_85_0");
            msgnextloc("WITH HER SOFT CLOUDS\nREFLECTED IN THE WATER/", "obj_board_npc_slash_Other_10_gml_86_0");
            msgnextloc("THIS IS THE PERFECT\nFORECAST FOR LOVE!/%", "obj_board_npc_slash_Other_10_gml_87_0");
            with (obj_b1oasis)
            {
                if (talkcon == 0)
                {
                    talkcon = 10;
                    talker = other.extflag;
                }
            }
        }
        if (read > 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "AS LONG AS THE OASIS\nSHINES^1,/", "obj_board_npc_slash_Other_10_gml_93_0");
            msgnextloc("THE WEATHER\nALWAYS STICKS TOGETHER!/%", "obj_board_npc_slash_Other_10_gml_140_0");
        }
    }
    if (extflag == "1Q")
    {
        if (read == 0)
        {
            msgsetloc(0, "I AM THE LOST PIPPINS./", "obj_board_npc_slash_Other_10_gml_101_0");
            msgnextloc("ON BEHALF OF THE TOYS YOU LOST IN THE COUCH^1, A SECRET.../", "obj_board_npc_slash_Other_10_gml_102_0");
            msgnextloc("THE CACTUS THAT LIVED UPSTAIRS LOVES YOU./", "obj_board_npc_slash_Other_10_gml_103_0");
            msgnextloc("IT HAS A KEY UNDERNEATH IT^1, SO PLEASE PUSH IT ASIDE./%", "obj_board_npc_slash_Other_10_gml_104_0");
        }
        else
        {
            msgsetloc(0, "THE CACTUS THAT LIVED UPSTAIRS LOVES YOU./", "obj_board_npc_slash_Other_10_gml_108_0");
            msgnextloc("IT HAS A KEY UNDERNEATH IT^1, SO PLEASE PUSH IT ASIDE./", "obj_board_npc_slash_Other_10_gml_109_0");
            msgnextloc("YOU CAN FIND IT IN THE CACTUS FIELD./%", "obj_board_npc_slash_Other_10_gml_110_0");
        }
    }
    if (extflag == "1Qa")
    {
        scr_speaker("Cactus Pippins NPC");
        msgsetloc(0, "GOOD^1, YOU PUSHED IT ASIDE./", "obj_board_npc_slash_Other_10_gml_166_0");
        msgnextloc("IT'S IMPORTANT TO PUSH YOUR LOVED ONES AWAY^1, SOMETIMES./%", "obj_board_npc_slash_Other_10_gml_167_0");
        if (i_ex(obj_board_cactus_flirt.key))
        {
            read = 0;
            msgsetloc(0, "YOU PUSHED IT ASIDE^1, BUT DIDN'T GET THE KEY?/", "obj_board_npc_slash_Other_10_gml_172_0");
            msgnextloc("THAT SEEMS SILLY./%", "obj_board_npc_slash_Other_10_gml_173_0");
        }
        else if (read)
        {
            msgsetloc(0, "PLEASE DON'T PUSH ME ASIDE./%", "obj_board_npc_slash_Other_10_gml_179_0_b");
        }
    }
    if (extflag == "TP")
    {
        scr_speaker("no_name");
        msgsetloc(0, "SEE THAT LINE ON THE TENSION BAR IN BATTLE?/", "obj_board_npc_slash_Other_10_gml_187_0");
        msgnextloc("WIN THE FIGHT WITH TP ABOVE THE LINE TO GET S-RANK!/", "obj_board_npc_slash_Other_10_gml_188_0");
        msgnextloc("BY THE WAY^1, I HEARD YOU CAN DEFEND TO GAIN TP./%", "obj_board_npc_slash_Other_10_gml_189_0");
        textside = 0;
    }
    if (extflag == "1C")
    {
        if (read == 0)
        {
            msgsetloc(0, "I AM THE LOST PIPPINS./", "obj_board_npc_slash_Other_10_gml_118_0");
            msgnextloc("ON BEHALF OF THE TOYS YOU LOST IN THE COUCH^1, A SECRET.../", "obj_board_npc_slash_Other_10_gml_119_0");
            if (!gamebeaten)
                msgnextloc("THERE ARE FOUR KEYS IN ALL^1, THOUGH YOU JUST NEED THREE./%", "obj_board_npc_slash_Other_10_gml_120_0");
            else
                msgnextloc("THERE ARE FIVE KEYS IN ALL^1, THOUGH YOU JUST NEED THREE./%", "obj_board_npc_slash_Other_10_gml_218_0");
        }
        else
        {
            if (!gamebeaten)
                msgsetloc(0, "THERE ARE FOUR KEYS./", "obj_board_npc_slash_Other_10_gml_124_0");
            else
                msgsetloc(0, "THERE ARE FIVE KEYS./", "obj_board_npc_slash_Other_10_gml_230_0_b");
            msgnextloc("ONE IS FOR RICH^1, ONE IS FOR TREASURE HUNTERS./", "obj_board_npc_slash_Other_10_gml_125_0");
            msgnextloc("ONE IS FOR KNOW IT ALL'S^1, ONE IS FOR CACTUS./%", "obj_board_npc_slash_Other_10_gml_126_0");
        }
    }
    if (extflag == "LILFOUNTAIN")
    {
        msgsetloc(0, "THIS IS MY PRIVATE LITTLE POND./", "obj_board_npc_slash_Other_10_gml_132_0");
        msgnextloc("I JUST WISH TO WADE IN PEACE./%", "obj_board_npc_slash_Other_10_gml_133_0");
        if (i_ex(obj_board_oasis))
        {
            if (obj_board_oasis.wither >= 1)
                msgsetloc(0, "WHAT HAVE YOU MANIACS DONE TO MY POND?!/%", "obj_board_npc_slash_Other_10_gml_139_0");
        }
    }
    if (extflag == "ROUXLSBLOCK")
        skip = true;
    if (room == room_board_2)
    {
        scr_speaker("no_name");
        if (extflag == "b2sadislandprev")
        {
            scr_speaker("no_name");
            msgsetloc(0, "THE OCEAN RAFT IS SEALED BY KODAKODA SHRINE./%", "obj_board_npc_slash_Other_10_gml_154_0");
        }
        if (extflag == "b2photohint1")
        {
            obj_b2enrichmentenclosure.ralseiknows = 1;
            scr_speaker("no_name");
            msgsetloc(0, "A FLOWER TORN IN HALF!/", "obj_board_npc_slash_Other_10_gml_161_0");
            msgnextloc("I WONDER WHO TOOK IT..^1. THE PHOTO^1, I MEAN./%", "obj_board_npc_slash_Other_10_gml_162_0");
        }
        if (extflag == "b2photohint2")
        {
            scr_speaker("no_name");
            msgsetloc(0, "A GREEN GEYSER^1, JUST NEXT DOOR./", "obj_board_npc_slash_Other_10_gml_169_0");
            msgnextloc("WHO CAN DIG IT UP?/%", "obj_board_npc_slash_Other_10_gml_170_0");
        }
        if (extflag == "b2photohint3")
        {
            scr_speaker("no_name");
            msgsetloc(0, "THE PLANT OF SPIKES^1, HIDES IN THE FOREST./", "obj_board_npc_slash_Other_10_gml_247_0_b");
            msgnextloc("IT'S NO ROSE^1, BUT ITS THORNS HOLD LOVE./%", "obj_board_npc_slash_Other_10_gml_248_0_b");
        }
        if (extflag == "b2photohint4")
        {
            scr_speaker("no_name");
            msgsetloc(0, "THE RED ANTLION^1, UNDER THE GROUND./", "obj_board_npc_slash_Other_10_gml_255_0_b");
            msgnextloc("FANGS OF YOUTH^1, UNEARTHED WITH A PHOTO./%", "obj_board_npc_slash_Other_10_gml_256_0_b");
        }
        textside = 1;
    }
    if (extflag == "b3entertainment")
    {
        skip = 1;
        if (read == 0)
            obj_b3entertainmentdistrict.con = 1;
    }
    if (room == room_board_postshadowmantle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "A TREASURE CHEST. IT'S TOO HIGH UP TO REACH./%", "obj_board_npc_slash_Other_10_gml_199_0");
        textside = 1;
    }
    if (extflag == "b2intro")
    {
        scr_speaker("no_name");
        msgsetloc(0, "WELCOME TO THE ISLAND BOARD!/", "obj_board_npc_slash_Other_10_gml_206_0");
        msgnextloc("ATLANTIS AWAITS IN THE NORTH./", "obj_board_npc_slash_Other_10_gml_207_0");
        msgnextloc("BUT, YOU WILL NEED 2 LOVERS TO UNVEIL THE RAINBOW BRIDGE./%", "obj_board_npc_slash_Other_10_gml_208_0");
        var photocount = global.flag[1041] + global.flag[1042] + global.flag[1043] + global.flag[1227];
        if (obj_b2raftget.con != 0)
            photocount = 0;
        if (photocount >= 3)
        {
            scr_speaker("no_name");
            msgsetloc(0, "WOAH WOAH^1! LOOK^1! THE CAMERA SHRINE IS ASHINE!/", "obj_board_npc_slash_Other_10_gml_348_0");
            msgnextloc("COULD SOMETHING BE HAPPENING INSIDE!?/%", "obj_board_npc_slash_Other_10_gml_349_0");
        }
        textside = 0;
    }
    if (extflag == "b3shopping")
    {
        scr_speaker("no_name");
        msgsetloc(0, "FEAST YOUR WALLETS ON OUR BUSTLING COMMERCIAL DISTRICT!/%", "obj_board_npc_slash_Other_10_gml_215_0");
        with (obj_b3center)
        {
            if (bustletalk == 0)
                bustletalk = 1;
        }
    }
    if (extflag == "b2bombfun2")
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "\\cGMOSS\\cW ON THE WALL./", "obj_board_npc_slash_Other_10_gml_229_0");
            msgnextloc("IT WAS CONSUMED./%", "obj_board_npc_slash_Other_10_gml_230_0");
            obj_b2bombfun2.mosscon = 1;
        }
        else
        {
            skip = 1;
        }
    }
    if (room == room_dw_b3bs_bibliox)
    {
        if (extflag == "bibliox")
        {
            scr_speaker("bibliox");
            var headright = stringsetloc("Why don't you head over to the right..^1. mumble.../%", "obj_board_npc_slash_Other_10_gml_258_0");
            switch (read)
            {
                case 0:
                    msgsetloc(0, "Mumble^1, Mumble..^1. where could this be...?/%", "obj_board_npc_slash_Other_10_gml_244_0");
                    break;
                case 1:
                    msgsetloc(0, "Nowhere? Mumble..^1. No^1, no..^1. This is somewhere.../%", "obj_board_npc_slash_Other_10_gml_245_0");
                    break;
                case 2:
                    msgsetloc(0, "Mumble^1, this old tome admires your..^1. inquisitiveness./%", "obj_board_npc_slash_Other_10_gml_246_0");
                    break;
                case 3:
                    msgsetloc(0, "Mumble..^1. You're very interested in going nowhere^1, aren't you?/%", "obj_board_npc_slash_Other_10_gml_247_0");
                    break;
                case 4:
                    msgsetloc(0, "Mumble..^1. well^1, I have a ticket there. Yes^1, I have a ticket there.../%", "obj_board_npc_slash_Other_10_gml_248_0");
                    break;
                case 5:
                    msgsetloc(0, "Mumble^1, mumble..^1. A ticket to nowhere..^1./%", "obj_board_npc_slash_Other_10_gml_249_0");
                    break;
                case 6:
                    msgsetloc(0, "Mumble^1, mumble..^1. But^1, the ticket is somewhere.../%", "obj_board_npc_slash_Other_10_gml_250_0");
                    break;
                case 7:
                    msgsetloc(0, "Mumble^1, mumble..^1. Yes^1, it was left here. It was left here by.../%", "obj_board_npc_slash_Other_10_gml_251_0");
                    break;
                case 8:
                    msgsetloc(0, "Mumble^1, oh^1, I don't seem to remember.../%", "obj_board_npc_slash_Other_10_gml_252_0");
                    break;
                case 9:
                    msgsetloc(0, "Mumble..^1. mumble..^1. You are alone^1, are you?/%", "obj_board_npc_slash_Other_10_gml_253_0");
                    break;
                case 10:
                    msgsetloc(0, "Good^1, it's not a good idea to go nowhere with somebody else.../%", "obj_board_npc_slash_Other_10_gml_254_0");
                    break;
                case 11:
                    msgsetloc(0, "Mumble^1, mumble..^1. alone is better..^1./%", "obj_board_npc_slash_Other_10_gml_255_0");
                    break;
                case 12:
                    msgsetloc(0, "I only have one ticket after all..^1. Where is it.../%", "obj_board_npc_slash_Other_10_gml_256_0");
                    break;
                case 13:
                    msgsetloc(0, "Mumble^1, mumble..^1. That's right^1, it's in the wardrobe!/%", "obj_board_npc_slash_Other_10_gml_257_0");
                    break;
                default:
                    msgset(0, headright);
                    break;
            }
            if (read > 13)
                global.flag[1092] = 1;
        }
        if (extflag == "bibliox2")
        {
            scr_speaker("no_name");
            msgsetloc(0, "Mumble..^1. That's odd..^1. I thought it was in the wardrobe.../%", "obj_board_npc_slash_Other_10_gml_275_0");
        }
        if (extflag == "cupboard")
        {
            scr_speaker("no_name");
            if (read == 0)
                snd_play(snd_board_door_close);
            msgsetloc(0, "YOU LOOKED IN THE WARDROBE./", "obj_board_npc_slash_Other_10_gml_281_0");
            msgnextloc("ALAS^1, THE WARDROBE WAS EMPTY!/%", "obj_board_npc_slash_Other_10_gml_282_0");
            if (read == 0)
            {
                global.flag[1092] = 3;
                with (obj_board_npc)
                {
                    if (extflag == "bibliox" || extflag == "bibliox2")
                    {
                        extflag = "bibliox3";
                        read = 0;
                    }
                }
            }
        }
        if (extflag == "bibliox3")
        {
            if (read)
            {
                scr_speaker("no_name");
                msgsetloc(0, "Mumble^1, mumble..^1. Mumble^1, mumble.../%", "obj_board_npc_slash_Other_10_gml_305_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "Mumble^1, mumble..^1. What? You can't find the ticket?/", "obj_board_npc_slash_Other_10_gml_310_0");
                msgnextloc("Odd^1, quite odd..^1. Considering.../", "obj_board_npc_slash_Other_10_gml_311_0");
                msgnextloc("You've been holding it from the moment you stepped in the room./%", "obj_board_npc_slash_Other_10_gml_312_0");
                with (obj_b3bs_bibliox)
                    con = 5;
            }
        }
    }
    if (extflag == "b3doorsdone")
    {
        scr_speaker("no_name");
        msgsetloc(0, "GREAT^1! YOU OPENED THE DOOR^1! CAN I TAKE A BREAK YET?/%", "obj_board_npc_slash_Other_10_gml_348_0");
        if (read == 0)
        {
            var tetalk = stringsetloc("NO! SHUT UP!", "obj_board_npc_slash_Other_10_gml_351_0");
            scr_script_delayed(scr_couchtalk, 80, tetalk, "tenna", 2, 60);
            with (obj_actor_tenna)
                scr_var_delay("bounce", 1, 80);
        }
    }
    if (extflag == "b2_blocker")
    {
        scr_speaker("no_name");
        msgsetloc(0, "PODIUMS BLOCK THE WAY. THEY ARE INSCRIBED WITH HALF A FLOWER./%", "obj_board_npc_slash_Other_10_gml_444_0");
    }
    if (room == room_dw_b3bs_idcardpuzzle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "THE RIVER DRIED UP DUE TO DROUGHT/%", "obj_board_npc_slash_Other_10_gml_364_0");
    }
    if (skip == false)
    {
        writer = instance_create(x, y, obj_board_writer);
        writer.side = textside;
    }
    else
    {
        myinteract = 0;
    }
    read++;
    if (extflag == "bibliox")
        global.flag[1141] = read;
    buffer = 5;
}
