draw_sprite_ext(bg_seam_shop_ch2, 0, 0, 0, 2, 2, 0, c_white, 1);
draw_sprite_ext(bg_seam_shop_ch2, 2, 0, 0, 2, 2, 0, c_white, abs(sin(siner / 30)));
siner += 1;
if (menu == 1 || menu == 2)
{
    if (shopcharx > -20)
        shopcharx -= 4;
    if (shopcharx > -40)
        shopcharx -= 4;
    if (shopcharx > -80)
        shopcharx -= 4;
    if (shopcharx <= -80)
        shopcharx = -80;
}
else
{
    if (shopcharx < -50)
        shopcharx += 4;
    if (shopcharx < -30)
        shopcharx += 4;
    if (shopcharx < 0)
        shopcharx += 4;
    if (shopcharx > 0)
        shopcharx = 0;
}
talkanim = 0;
if (instance_exists(obj_writer))
{
    if (obj_writer.pos < obj_writer.length)
    {
        if (talkbuffer < 0)
            talkfacer = 0;
        talkbuffer = 16;
        talkanim = 1;
        idletimer = 0;
        idlefacer = 0;
        talkfacer += 0.2;
    }
}
shopkeepsprite = spr_seam_talk;
if (global.fe == 1)
    shopkeepsprite = spr_seam_oh;
if (global.fe == 2)
    shopkeepsprite = spr_seam_laugh;
if (global.fe == 3)
    shopkeepsprite = spr_seam_impatient;
qualify = 0;
if (global.fe != 0 && talkbuffer < 0)
    talkbuffer = 0;
if (talkbuffer >= 0)
{
    if (talkbuffer < 16)
    {
        if (((talkfacer + 1) % 3) != 0)
            talkfacer += 0.2;
    }
    draw_sprite_ext(shopkeepsprite, talkfacer, shopcharx + 160, 34, 2, 2, 0, c_white, 1);
    qualify = 1;
}
if (qualify == 0)
{
    idletimer += 1;
    if (idletimer >= 60)
        idlefacer += 0.2;
    if (idlefacer >= 5)
    {
        idletimer = 0;
        idlefacer = 0;
    }
    draw_sprite_ext(spr_seam_idle, idlefacer, shopcharx + 160, 34, 2, 2, 0, c_white, 1);
}
talkbuffer -= 1;
draw_set_color(c_black);
ossafe_fill_rectangle(0, 240, 640, 480, false);
scr_shopmenu(0);
if (menu <= 3 || menu >= 10)
{
    scr_darkbox_black(0, 240, 415, 480);
    scr_darkbox_black(400, 240, 640, 480);
}
if (menu == 4)
    scr_darkbox_black(0, 240, 640, 480);
if (menu == 0)
{
    sell = 0;
    selling = 0;
    sidemessage = 0;
    menuc[1] = 0;
    menuc[2] = 0;
    menuc[3] = 0;
    menuc[4] = 0;
    if (instance_exists(obj_writer) == false)
    {
        global.typer = 6;
        global.msg[0] = stringsetloc("\\E0* Take your time..^1.&* Ain't like it's&better spent.", "obj_shop1_slash_Draw_0_gml_98_0");
        if (mainmessage == 0)
            global.msg[0] = stringsetloc("\\E0* Hee hee..^1.&* Welcome, travellers.", "obj_shop1_slash_Draw_0_gml_99_0");
        instance_create(30, 270, obj_writer);
    }
    menumax = 3;
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    draw_text(480, 260, string_hash_to_newline(stringsetloc("Buy", "obj_shop1_slash_Draw_0_gml_106_0")));
    draw_text(480, 300, string_hash_to_newline(stringsetloc("Sell", "obj_shop1_slash_Draw_0_gml_107_0")));
    draw_text(480, 340, string_hash_to_newline(stringsetloc("Talk", "obj_shop1_slash_Draw_0_gml_108_0")));
    draw_text(480, 380, string_hash_to_newline(stringsetloc("Exit", "obj_shop1_slash_Draw_0_gml_109_0")));
    draw_sprite(spr_heart, 0, 450, (135 + (menuc[0] * 20)) * 2);
    if (button1_p())
    {
        onebuffer = 2;
        mainmessage = 1;
        with (obj_writer)
            instance_destroy();
        if (menuc[0] == 0)
            menu = 1;
        if (menuc[0] == 1)
        {
            menu = 10;
            sidemessage = 0;
        }
        if (menuc[0] == 2)
        {
            if (global.chapter == 1)
                menu = 3;
            if (global.chapter >= 2)
                menu = 4;
            sell = 10;
        }
        if (menuc[0] == 3)
        {
            sell = 2;
            menu = 4;
        }
    }
}
if (menu == 1 || menu == 2)
{
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    for (i = 0; i < itemtotal; i += 1)
    {
        draw_text(60, 260 + (i * 40), string_hash_to_newline(shopitemname[i]));
        draw_text(300, 260 + (i * 40), string_hash_to_newline(stringsetsubloc("$~1", string(buyvalue[i]), "obj_shop1_slash_Draw_0_gml_143_0")));
    }
    draw_text(60, 260 + (itemtotal * 40), string_hash_to_newline(stringsetloc("Exit", "obj_shop1_slash_Draw_0_gml_139_0")));
    if (menu == 1)
    {
        menumax = 4;
        if (instance_exists(obj_writer) == false)
        {
            if (sidemessage == 0)
                global.msg[0] = stringsetloc("\\E0What do&you like&to buy?", "obj_shop1_slash_Draw_0_gml_148_0");
            if (sidemessage == 1)
                global.msg[0] = stringsetloc("\\E2Thanks for&that.", "obj_shop1_slash_Draw_0_gml_149_0");
            if (sidemessage == 2)
                global.msg[0] = stringsetloc("\\E0What,&not good&enough?", "obj_shop1_slash_Draw_0_gml_150_0");
            if (sidemessage == 3)
                global.msg[0] = stringsetloc("\\E3Not&enough&money.", "obj_shop1_slash_Draw_0_gml_151_0");
            if (sidemessage == 4)
                global.msg[0] = stringsetloc("\\E3You're&carrying&too much.", "obj_shop1_slash_Draw_0_gml_152_0");
            if (sidemessage == 5)
                msgsetloc(0, "\\E2Thanks, it'll&be in your&STORAGE.", "obj_shop1_slash_Draw_0_gml_159_0");
            if (murder == 1)
                global.msg[0] = stringsetloc("/*", "obj_shop1_slash_Draw_0_gml_153_0");
            instance_create(450, 260, obj_writer);
        }
        draw_sprite(spr_heart, 0, 30, 270 + (menuc[1] * 40));
        if (button1_p() && onebuffer < 0)
        {
            menu = 2;
            onebuffer = 2;
            with (obj_writer)
                instance_destroy();
            if (menuc[1] == menumax)
                menu = 0;
        }
        if (button2_p() && twobuffer < 0 && onebuffer < 2)
        {
            menu = 0;
            twobuffer = 2;
            minimenuy = 220;
            with (obj_writer)
                instance_destroy();
        }
        menuc[2] = 0;
    }
    if (menu == 2)
    {
        menumax = 1;
        draw_set_color(c_white);
        scr_84_set_draw_font("mainbig");
        var y1_off = langopt(260, 290);
        var y2_off = langopt(290, 260);
        draw_text(460, y1_off, string_hash_to_newline(stringsetloc("Buy it for", "obj_shop1_slash_Draw_0_gml_167_0")));
        draw_text(460, y2_off, string_hash_to_newline(stringsetsubloc("$~1 ?", string(buyvalue[menuc[1]]), "obj_shop1_slash_Draw_0_gml_177_0")));
        draw_text(480, 340, string_hash_to_newline(stringsetloc("Yes", "obj_shop1_slash_Draw_0_gml_169_0")));
        draw_text(480, 370, string_hash_to_newline(stringsetloc("No", "obj_shop1_slash_Draw_0_gml_170_0")));
        draw_sprite(spr_heart, 0, 450, 350 + (menuc[2] * 30));
        if (button2_p() && twobuffer < 0)
        {
            menu = 1;
            sidemessage = 2;
            twobuffer = 2;
            onebuffer = 2;
        }
        if (button1_p() && onebuffer < 0 && twobuffer < 0)
        {
            if (menuc[2] == 0)
            {
                afford = 0;
                if (global.gold >= buyvalue[menuc[1]])
                    afford = 1;
                if (afford == 1)
                {
                    _pocketed = 0;
                    if (itemtype[menuc[1]] == "item")
                        scr_itemget(item[menuc[1]]);
                    if (itemtype[menuc[1]] == "weapon")
                        scr_weaponget(item[menuc[1]]);
                    if (itemtype[menuc[1]] == "armor")
                        scr_armorget(item[menuc[1]]);
                    if (noroom == 0)
                    {
                        global.gold -= buyvalue[menuc[1]];
                        snd_play(snd_locker);
                        if (_pocketed == 1)
                            sidemessage = 5;
                        else
                            sidemessage = 1;
                    }
                    if (noroom == 1)
                        sidemessage = 4;
                }
                else
                {
                    sidemessage = 3;
                }
            }
            if (menuc[2] == 1)
                sidemessage = 2;
            menu = 1;
        }
    }
    if (menuc[1] != 4)
    {
        if (minimenuy <= 20)
            minimenuy = 20;
        if (minimenuy > 20)
            minimenuy -= 5;
        if (minimenuy > 50)
            minimenuy -= 5;
        if (minimenuy > 100)
            minimenuy -= 8;
        if (minimenuy > 150)
            minimenuy -= 10;
    }
    else if (minimenuy < 200)
    {
        minimenuy += 40;
    }
    if (minimenuy >= 200)
        minimenuy = 200;
}
if (menu == 3)
{
    menumax = 4;
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    draw_text(80, 260, string_hash_to_newline(stringsetloc("About yourself", "obj_shop1_slash_Draw_0_gml_217_0")));
    draw_text(80, 300, string_hash_to_newline(stringsetloc("Lightners", "obj_shop1_slash_Draw_0_gml_218_0")));
    if (global.flag[241] < 6)
    {
        draw_text(80, 340, string_hash_to_newline(stringsetloc("Kingdom", "obj_shop1_slash_Draw_0_gml_220_0")));
    }
    else
    {
        draw_set_color(c_yellow);
        draw_text(80, 340, string_hash_to_newline(stringsetloc("About JEVIL", "obj_shop1_slash_Draw_0_gml_224_0")));
    }
    if (global.flag[241] == 0)
    {
        draw_text(80, 380, string_hash_to_newline(stringsetloc("We're legendary", "obj_shop1_slash_Draw_0_gml_227_0")));
    }
    else
    {
        _legendstring = stringsetloc("Strange Prisoner", "obj_shop1_slash_Draw_0_gml_241_0");
        draw_set_color(c_yellow);
        if (global.flag[115] >= 1)
            draw_set_color(c_white);
        if (global.flag[241] >= 6)
        {
            draw_set_color(c_yellow);
            _legendstring = stringsetloc("We Won", "obj_shop1_slash_Draw_0_gml_244_0");
        }
        draw_text(80, 380, string_hash_to_newline(_legendstring));
    }
    draw_set_color(c_white);
    draw_text(80, 420, string_hash_to_newline(stringsetloc("Exit", "obj_shop1_slash_Draw_0_gml_240_0")));
    if (instance_exists(obj_writer) == false)
    {
        global.msg[0] = stringsetloc("\\E0Don't have&anything&better&to do.", "obj_shop1_slash_Draw_0_gml_255_0");
        instance_create(440, 260, obj_writer);
    }
    draw_sprite(spr_heart, 0, 50, 270 + (menuc[3] * 40));
    if (button1_p() && onebuffer < 0)
    {
        onebuffer = 2;
        with (obj_writer)
            instance_destroy();
        if (menuc[3] < menumax)
        {
            sell = menuc[3] + 3;
            menu = 4;
        }
        else
        {
            menu = 0;
        }
    }
    else if (button2_p() && twobuffer < 0 && onebuffer < 0)
    {
        twobuffer = 2;
        menu = 0;
        with (obj_writer)
            instance_destroy();
    }
}
if (menu == 10)
{
    menuc[11] = 0;
    menuc[12] = 0;
    menuc[13] = 0;
    menumax = 4;
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    draw_text(80, 260, string_hash_to_newline(stringsetloc("Sell Items", "obj_shop1_slash_Draw_0_gml_278_0")));
    draw_text(80, 300, string_hash_to_newline(stringsetloc("Sell Weapons", "obj_shop1_slash_Draw_0_gml_279_0")));
    draw_text(80, 340, string_hash_to_newline(stringsetloc("Sell Armor", "obj_shop1_slash_Draw_0_gml_280_0")));
    draw_text(80, 380, string_hash_to_newline(stringsetloc("Sell Pocket Items", "obj_shop1_slash_Draw_0_gml_292_0")));
    draw_text(80, 420, string_hash_to_newline(stringsetloc("Return", "obj_shop1_slash_Draw_0_gml_293_0")));
    if (instance_exists(obj_writer) == false)
    {
        if (sidemessage == 0)
            global.msg[0] = stringsetloc("\\E0What kind&of junk&you got?", "obj_shop1_slash_Draw_0_gml_285_0");
        if (sidemessage == 1)
            global.msg[0] = stringsetloc("\\E0That's it&for that.", "obj_shop1_slash_Draw_0_gml_286_0");
        if (sidemessage == 2)
            global.msg[0] = stringsetloc("\\E3You don't&have&anything!", "obj_shop1_slash_Draw_0_gml_287_0");
        instance_create(460, 260, obj_writer);
    }
    draw_sprite(spr_heart, 0, 50, 270 + (menuc[10] * 40));
    if (button1_p() && onebuffer < 0)
    {
        pagemax = 0;
        sidemessage2 = 0;
        onebuffer = 2;
        with (obj_writer)
            instance_destroy();
        can = 1;
        idealmenu = menuc[10] + 11;
        if (idealmenu == 11)
        {
            scr_itemcheck(0);
            if (itemcount == 12)
            {
                sidemessage = 2;
                can = 0;
            }
            nothingcount = itemcount;
            scr_iteminfo_all();
            selltype = "item";
            selltotal = 12;
            for (i = 0; i < selltotal; i++)
            {
                itemsellvalue[i] = global.itemvalue[i];
                itemsellname[i] = global.itemnameb[i];
            }
        }
        if (idealmenu == 12)
        {
            scr_weaponcheck_inventory(0);
            if (itemcount == 48)
            {
                sidemessage = 2;
                can = 0;
            }
            scr_weaponinfo_all();
        }
        if (idealmenu == 13)
        {
            scr_armorcheck_inventory(0);
            if (itemcount == 48)
            {
                sidemessage = 2;
                can = 0;
            }
            scr_armorinfo_all();
        }
        if (idealmenu == 14)
        {
            scr_itemcheck_pocket(0);
            if (itemcount == global.flag[64])
            {
                sidemessage = 2;
                can = 0;
            }
            selltype = "pocket";
            nothingcount = 0;
            selltotal = global.flag[64];
            for (i = 0; i < global.flag[64]; i++)
            {
                scr_iteminfo(global.pocketitem[i]);
                itemsellvalue[i] = value;
                itemsellname[i] = itemnameb;
            }
            idealmenu = 11;
        }
        if (menuc[10] < menumax)
        {
            if (can == 1)
                menu = idealmenu;
            sidemessage1 = 0;
        }
        else
        {
            menu = 0;
        }
        submenu = 0;
        submenuc[1] = 0;
    }
    if (button2_p() && twobuffer < 0 && onebuffer < 0)
    {
        twobuffer = 2;
        menu = 0;
        with (obj_writer)
            instance_destroy();
    }
}
if (menu == 11 || menu == 12 || menu == 13 || menu == 14)
{
    if (instance_exists(obj_writer) == false)
    {
        if (sidemessage2 == 0 && (menu == 11 || menu == 14))
            global.msg[0] = stringsetloc("\\E0Alright,&give me&an ITEM.", "obj_shop1_slash_Draw_0_gml_347_0");
        if (sidemessage2 == 0 && menu == 12)
            global.msg[0] = stringsetloc("\\E0What WEAPON&will you&give me?", "obj_shop1_slash_Draw_0_gml_348_0");
        if (sidemessage2 == 0 && menu == 13)
            global.msg[0] = stringsetloc("\\E0What ARMOR&will you&give me?", "obj_shop1_slash_Draw_0_gml_349_0");
        if (sidemessage2 == 1)
            global.msg[0] = stringsetloc("\\E2Thanks for&that.", "obj_shop1_slash_Draw_0_gml_350_0");
        if (sidemessage2 == 2)
            global.msg[0] = stringsetloc("\\E0No?", "obj_shop1_slash_Draw_0_gml_351_0");
        if (sidemessage2 == 3)
            global.msg[0] = stringsetloc("\\E3Y'think I&WANT that?", "obj_shop1_slash_Draw_0_gml_352_0");
        if (sidemessage2 == 4)
            global.msg[0] = stringsetloc("\\E0That's&nothing.", "obj_shop1_slash_Draw_0_gml_353_0");
        instance_create(450, 260, obj_writer);
    }
}
scr_shopmenu(4);
if (menu == 15 || menu == 16 || menu == 17 || menu == 18)
{
    menumax = 1;
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    var y1_off = langopt(260, 290);
    var y2_off = langopt(290, 260);
    draw_text(460, y1_off, string_hash_to_newline(stringsetloc("Sell it for", "obj_shop1_slash_Draw_0_gml_365_0")));
    draw_text(460, y2_off, string_hash_to_newline(stringsetsubloc("$~1 ?", string(sellvalue), "obj_shop1_slash_Draw_0_gml_407_0")));
    draw_text(480, 340, string_hash_to_newline(stringsetloc("Yes", "obj_shop1_slash_Draw_0_gml_367_0")));
    draw_text(480, 370, string_hash_to_newline(stringsetloc("No", "obj_shop1_slash_Draw_0_gml_368_0")));
    draw_sprite(spr_heart, 0, 450, 350 + (menuc[menu] * 30));
}
scr_shopmenu(5);
if (menu == 4)
{
    if (sell == 0)
        menu = 0;
    if (instance_exists(obj_writer) == false && selling == 0)
    {
        if (sell == 1)
        {
        }
        if (sell == 2)
            global.msg[0] = stringsetloc("\\E0* See you again..^1.&* Or not^1.&* Ha ha ha ha.../%", "obj_shop1_slash_Draw_0_gml_395_0");
        if (sell == 10)
        {
            var normal_route = true;
            var shadow_crystal_jevil = global.flag[954] == 1;
            var shadow_crystal_sneo = global.flag[353] >= 1;
            var has_shadow_mantle = scr_armorcheck_equipped_any(23) > 0 || scr_armorcheck_inventory(23) == 1;
            if (scr_flag_get(961) == 0)
            {
                if (shadow_crystal_jevil && shadow_crystal_sneo)
                {
                    if (global.flag[1047] == 1)
                    {
                        normal_route = false;
                        if (scr_flag_get(856) == 0)
                        {
                            scr_speaker("seam");
                            msgsetloc(0, "\\E0* Ah^1, I know what you're going to say. Now^1, now^1, there's no shame in it./", "obj_shop1_slash_Draw_0_gml_460_0_b");
                            msgnextloc("\\E2* You fought the Knight^1, didn't you? Well^1, we all know there's no winning there.../", "obj_shop1_slash_Draw_0_gml_461_0_b");
                            msgnextloc("\\E1* ..^1. what!? You GOT the Shadow Crystal!?/", "obj_shop1_slash_Draw_0_gml_462_0");
                            if (has_shadow_mantle)
                            {
                                msgnextloc("\\E3* ..^1. I see^1, so you were able to recover the Shadow Mantle./", "obj_shop1_slash_Draw_0_gml_467_0");
                                msgnextloc("\\E1* That's odd. Kris..^1. where did you find it?/", "obj_shop1_slash_Draw_0_gml_468_0");
                            }
                            else
                            {
                                msgnextloc("\\E1* ..^1. And without even using the Shadow Mantle!?/", "obj_shop1_slash_Draw_0_gml_471_0");
                                msgnextloc("\\E2* Hee hee..^1. You three^1! You might be even sicker than that old clown!/", "obj_shop1_slash_Draw_0_gml_472_0_b");
                                msgnextloc("\\E0* Oh^1, it must've been a terrific match^1! If only I could've witnessed it.../", "obj_shop1_slash_Draw_0_gml_473_0_b");
                            }
                        }
                    }
                    if (global.flag[1047] == 2)
                    {
                        normal_route = false;
                        scr_speaker("seam");
                        msgsetloc(0, "\\E0* Ah^1, I know what you're going to say. Now^1, now^1, there's no shame in it./", "obj_shop1_slash_Draw_0_gml_498_0");
                        msgnextloc("\\E3* You fought the Knight^1, didn't you? Well^1, we all know there's no winning there.../", "obj_shop1_slash_Draw_0_gml_499_0");
                        if (has_shadow_mantle)
                        {
                            msgnextloc("\\E0* Even with the SHADOW MANTLE^1, you might have had a chance.../", "obj_shop1_slash_Draw_0_gml_503_0_b");
                            msgnextloc("\\E3* But even then^1, getting the SHADOW CRYSTAL would be..^1. challenging./", "obj_shop1_slash_Draw_0_gml_504_0_b");
                        }
                        else
                        {
                            msgnextloc("\\E1* If only you had the SHADOW MANTLE^1, your luck might have gone another way./", "obj_shop1_slash_Draw_0_gml_507_0_b");
                            msgnextloc("\\E0* But^1, it's over now^1, isn't it? No mantle^1, no crystal./", "obj_shop1_slash_Draw_0_gml_508_0");
                        }
                        msgnextloc("\\E0* Don't have a long face^1, now. We all knew nothing would come of this./", "obj_shop1_slash_Draw_0_gml_511_0");
                        msgnextloc("\\E2* But it was fun..^1. to pretend it might^1, for a little while./", "obj_shop1_slash_Draw_0_gml_512_0");
                        msgnextloc("\\E0* Thank you./%", "obj_shop1_slash_Draw_0_gml_513_0");
                        scr_flag_set(961, 1);
                    }
                }
                else if (scr_get_total_shadow_crystal_amount() == 3)
                {
                    normal_route = false;
                    if (scr_flag_get(856) == 0)
                    {
                        scr_speaker("seam");
                        msgsetloc(0, "\\E1* What!? Is that..^1. a Shadow Crystal!?/", "obj_shop1_slash_Draw_0_gml_515_0");
                        msgnextloc("\\E3* Meaning^1, you must have.../", "obj_shop1_slash_Draw_0_gml_516_0");
                    }
                }
            }
            if (normal_route)
            {
                if (scr_flag_get(855) == 0)
                {
                    scr_flag_set(855, 1);
                    scr_speaker("seam");
                    msgsetloc(0, "\\E0* I've got a funny story. You see^1, the Addisons wanted to buy out my store./", "obj_shop1_slash_Draw_0_gml_529_0");
                    msgnextloc("\\E2* So I bet them for it on a game of cards./", "obj_shop1_slash_Draw_0_gml_530_0");
                    msgnextloc("\\E3* Hand after hand^1, they lost and lost^1, stubbornly doubling their bet each time./", "obj_shop1_slash_Draw_0_gml_531_0");
                    msgnextloc("\\E0* After a while^1, they'd lost their store^1, their money^1, and even some of their clothes.../", "obj_shop1_slash_Draw_0_gml_532_0");
                    msgnextloc("\\E2* Hahaha!/", "obj_shop1_slash_Draw_0_gml_533_0");
                    msgnextloc("\\E0* Of course^1, in the end^1, I laughed and gave it all back./", "obj_shop1_slash_Draw_0_gml_534_0");
                    msgnextloc("\\E2* But it was fun to give them a little scare./", "obj_shop1_slash_Draw_0_gml_535_0");
                    msgnextloc("\\E3* ..^1. Although^1, not as fun as if they could actually win./%", "obj_shop1_slash_Draw_0_gml_536_0");
                }
                else
                {
                    scr_speaker("seam");
                    msgsetloc(0, "\\E0* ..^1. It's funny you insist on hanging around here./", "obj_shop1_slash_Draw_0_gml_540_0");
                    msgnextloc("\\E2* I won't sell nor say anything new^1, I'm afraid./", "obj_shop1_slash_Draw_0_gml_541_0");
                    msgnextloc("\\E3* I'll brew a cup of tea and get out the blankets^1, but leave when you please./%", "obj_shop1_slash_Draw_0_gml_542_0");
                }
            }
            else if (scr_flag_get(961) == 0)
            {
                if (scr_flag_get(856) == 0)
                {
                    scr_flag_set(856, 1);
                    msgnextloc("\\E2* ..^1. Well^1, never mind that^1! You got the Crystal^1, that's all that matters!/", "obj_shop1_slash_Draw_0_gml_477_0_b");
                    msgnextloc("\\E0* Now you've got three. Only two more^1, and we should have enough.../", "obj_shop1_slash_Draw_0_gml_478_0_b");
                    msgnextloc("\\E2* ..^1. to make something I think you'll quite enjoy. Now good luck..^1. and I'll be taking that Shadow Crystal./%", "obj_shop1_slash_Draw_0_gml_479_0_b");
                    scr_keyitemremove(13);
                    took_crystal = true;
                }
                else
                {
                    scr_speaker("seam");
                    msgsetloc(0, "\\E0* It's strange. By all reasonable means^1, the strength of your next opponent.../", "obj_shop1_slash_Draw_0_gml_486_0_b");
                    msgnextloc("\\E1* Should be enough to already ring the bell on your defeat./", "obj_shop1_slash_Draw_0_gml_487_0");
                    msgnextloc("\\E0* But^1, for some reason..^1. I can't help but think you may win./", "obj_shop1_slash_Draw_0_gml_488_0");
                    msgnextloc("\\E2* What is this feeling? ..^1. Hope? Hahaha^1! Whatever it is^1, it's quite funny!/%", "obj_shop1_slash_Draw_0_gml_489_0");
                }
            }
        }
        instance_create(30, 270, obj_writer);
        selling = 1;
    }
    if (selling == 1 && instance_exists(obj_writer) == false)
    {
        if (took_crystal)
        {
            took_crystal = false;
            snd_play(snd_item);
        }
        if (sell == 2)
        {
            selling = 2;
            event_user(1);
        }
        else
        {
            if (sell == 1 || sell == 7 || sell == 10)
                menu = 0;
            else
                menu = 3;
            sell = 0;
            selling = 0;
        }
    }
}
if (down_p())
{
    if (menu != 11 && menu != 12 && menu != 13)
    {
        menuc[menu] += 1;
        if (menuc[menu] > menumax)
            menuc[menu] = 0;
    }
}
if (up_p())
{
    if (menu != 11 && menu != 12 && menu != 13)
    {
        menuc[menu] -= 1;
        if (menuc[menu] < 0)
            menuc[menu] = menumax;
    }
}
if (menu < 4 || menu >= 10)
{
    draw_text(440, 420, "$" + string_hash_to_newline(string(global.gold)));
    if (menu == 1 || menu == 2)
    {
        if (menuc[1] < 4)
            scr_shop_space_display(menuc[1]);
    }
}
onebuffer -= 1;
twobuffer -= 1;
