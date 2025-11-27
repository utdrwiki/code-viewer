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
draw_rectangle(0, 240, 640, 480, false);
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
        if (sell == 3)
        {
            global.msg[0] = stringsetloc("\\E0* The name's Seam.&* Pronounced \"Shawm.\"/", "obj_shop1_slash_Draw_0_gml_399_0");
            global.msg[1] = stringsetloc("\\E0* And this is my little Seap^1.&* Ha ha ha ha.../", "obj_shop1_slash_Draw_0_gml_400_0");
            global.msg[2] = stringsetloc("\\E0* Over the years, I've collected odds and ends./", "obj_shop1_slash_Draw_0_gml_401_0");
            global.msg[3] = stringsetloc("* 'Course, I've no attachment to any of it^1.&* It's just a hobby of mine./", "obj_shop1_slash_Draw_0_gml_402_0");
            global.msg[4] = stringsetloc("* Around here, you learn to find ways to pass the time...&* ... or go mad like everyone else./%", "obj_shop1_slash_Draw_0_gml_403_0");
        }
        if (sell == 4)
        {
            global.msg[0] = stringsetloc("\\E1* Long ago, the Darkners lived in harmony with the Lightners./", "obj_shop1_slash_Draw_0_gml_411_0");
            global.msg[1] = stringsetloc("\\E0* They were like Gods to us.&* Our protectors.&* Our creators.&* Those who gave us purpose.../", "obj_shop1_slash_Draw_0_gml_412_0");
            global.msg[2] = stringsetloc("\\E3* Then, one day we were all locked away in this prison..^1.&* And the Lightners never returned./", "obj_shop1_slash_Draw_0_gml_413_0");
            global.msg[3] = stringsetloc("\\E1* Embittered^1, the King took up arms^1, and aims to take revenge upon the Lightners that left us behind./", "obj_shop1_slash_Draw_0_gml_414_0");
            global.msg[4] = stringsetloc("\\E0* 'Course^1, even among his troops^1, some still distantly hope the Lightners will return.../%", "obj_shop1_slash_Draw_0_gml_415_0");
        }
        if (sell == 5)
        {
            global.msg[0] = stringsetloc("\\E0* Historically^1, this land was ruled by the Four Kings^1, from \\cYCARD CASTLE\\cW to the East./", "obj_shop1_slash_Draw_0_gml_421_0");
            global.msg[1] = stringsetloc("\\E1* But, recently, a \\cRstrange knight\\cW appeared..^1.&* And three of the kings were locked away./", "obj_shop1_slash_Draw_0_gml_422_0");
            global.msg[2] = stringsetloc("\\E0* The remaining king put him and his strange son into power./", "obj_shop1_slash_Draw_0_gml_423_0");
            global.msg[3] = stringsetloc("\\E1* This land hasn't seen THIS much chaos since.../", "obj_shop1_slash_Draw_0_gml_424_0");
            global.msg[4] = stringsetloc("\\E2* Ha ha ha..^1.&* Well, you don't need to know about THAT./%", "obj_shop1_slash_Draw_0_gml_425_0");
            if (global.flag[241] >= 6)
            {
                global.msg[0] = stringsetloc("\\E0* He..^1. was a funny little man^1. Once^1, the court jester^1. I^1, the court magician./", "obj_shop1_slash_Draw_0_gml_429_0");
                global.msg[1] = stringsetloc("\\E1* A friend...^1? Could I consider him a friend...^1? Perhaps^1, perhaps not./", "obj_shop1_slash_Draw_0_gml_430_0");
                global.msg[2] = stringsetloc("\\E2* But he was the only one who matched me in the games we used to play./", "obj_shop1_slash_Draw_0_gml_431_0");
                global.msg[3] = stringsetloc("\\E3* One day^1, he met a strange someone..^1. and since then^1, he began to change./", "obj_shop1_slash_Draw_0_gml_432_0");
                global.msg[4] = stringsetloc("\\E1* He started saying bizarre things that didn't completely make sense -/", "obj_shop1_slash_Draw_0_gml_433_0");
                global.msg[5] = stringsetloc("\\E3* But didn't completely not make sense^1, either./", "obj_shop1_slash_Draw_0_gml_434_0");
                global.msg[6] = stringsetloc("* Soon^1, he began to see the world as a game^1, and everyone as its participants./", "obj_shop1_slash_Draw_0_gml_435_0");
                global.msg[7] = stringsetloc("* As the court mage^1, and his only companion^1, I was forced to lock him away.../", "obj_shop1_slash_Draw_0_gml_436_0");
                global.msg[8] = stringsetloc("\\E2* Or^1, rather^1, lock US all away^1, in his own words./", "obj_shop1_slash_Draw_0_gml_437_0");
                global.msg[9] = stringsetloc("\\E1* Since that time^1, the strange words he's said have stuck inside my cotton.../", "obj_shop1_slash_Draw_0_gml_438_0");
                global.msg[10] = stringsetloc("\\E3* And my view of this world has become darker^1, yet darker./", "obj_shop1_slash_Draw_0_gml_439_0");
                global.msg[11] = stringsetloc("\\E2* Reflecting on these old memories^1, I think^1, perhaps ^1- I miss playing games with him./", "obj_shop1_slash_Draw_0_gml_440_0");
                global.msg[12] = stringsetloc("\\E3* And I wonder^1, if I hadn't been asked to lock him up.../", "obj_shop1_slash_Draw_0_gml_441_0");
                global.msg[13] = stringsetloc("\\E2* Would I have found a little more purpose in my life...?/%", "obj_shop1_slash_Draw_0_gml_442_0");
            }
        }
        if (sell == 6)
        {
            global.msg[0] = stringsetloc("\\E2* Ha ha ha ..^1.&* So you are the \"heroes\" who are going to seal our Fountain?/", "obj_shop1_slash_Draw_0_gml_448_0");
            global.msg[1] = stringsetloc("\\E0* Ha, good luck^1.&* It makes no difference to me./", "obj_shop1_slash_Draw_0_gml_449_0");
            global.msg[2] = stringsetloc("\\E3* Neither Light nor Dark hold a future for a Darkner in my condition./%", "obj_shop1_slash_Draw_0_gml_450_0");
            if (global.flag[241] >= 1 && global.flag[115] == 1)
            {
                global.msg[0] = stringsetloc("\\E1* Trouble opening the door...?/", "obj_shop1_slash_Draw_0_gml_459_0");
                global.msg[1] = stringsetloc("\\E0* Ha ha ha^1, well^1, whether you can or not^1, it doesn't matter to me./", "obj_shop1_slash_Draw_0_gml_460_0");
                global.msg[2] = stringsetloc("\\E2* But here's a hint ^1- \\cYwalk where the stars don't shine\\cW./%", "obj_shop1_slash_Draw_0_gml_461_0");
            }
            if (global.flag[241] >= 1 && global.flag[115] == 0)
            {
                global.msg[0] = stringsetloc("\\E3* Eh...^1? What are you talking about...^1? A prisoner with an odd manner...?/", "obj_shop1_slash_Draw_0_gml_472_0");
                global.msg[1] = stringsetloc("\\E1* ... No^1, you couldn't possibly be talking about HIM...?/", "obj_shop1_slash_Draw_0_gml_473_0");
                global.msg[2] = stringsetloc("\\E3* ... I see^1.&* After all the trouble I went through to lock him up^1, you want to release him?/", "obj_shop1_slash_Draw_0_gml_474_0");
                global.msg[3] = stringsetloc("\\E0* .../", "obj_shop1_slash_Draw_0_gml_475_0");
                global.msg[4] = stringsetloc("\\E1* Hmm^1, now that you mention it^1, it could be troublesome if he was left alone.../", "obj_shop1_slash_Draw_0_gml_476_0");
                global.msg[5] = stringsetloc("\\E0* Yes^1, perhaps it's better if you Heroes dealt with him now...?/", "obj_shop1_slash_Draw_0_gml_477_0");
                global.msg[6] = stringsetloc("\\E2* After all^1, it's not as if whatever happens^1, will matter in the end./", "obj_shop1_slash_Draw_0_gml_478_0");
                global.msg[7] = stringsetloc("* Perhaps a little chaos might be fun./", "obj_shop1_slash_Draw_0_gml_479_0");
                global.msg[8] = stringsetloc("\\E0* So then, take this./", "obj_shop1_slash_Draw_0_gml_480_0");
                global.writersnd[0] = snd_item;
                global.msg[9] = stringsetloc("\\S0* (\\cYBROKEN KEY A\\cW was added to your \\cYKEY ITEMS\\cW.)/", "obj_shop1_slash_Draw_0_gml_482_0");
                global.msg[10] = stringsetloc("* If you're so driven^1, find the other \\cYtwo\\cW pieces^1, and get someone to \\cYfix\\cW them./", "obj_shop1_slash_Draw_0_gml_483_0");
                global.msg[11] = stringsetloc("* I'll even give you a hint - \\cYWalk where the stars don't shine\\cW./", "obj_shop1_slash_Draw_0_gml_484_0");
                global.msg[12] = stringsetloc("* Anyhow^1, if you succeed^1, come back here and tell me^1! Good luck!!/", "obj_shop1_slash_Draw_0_gml_485_0");
                global.msg[13] = stringsetloc("* If you can call THIS luck..^1. No^1, it's more like a curse...!/%", "obj_shop1_slash_Draw_0_gml_486_0");
                scr_keyitemget(4);
                global.flag[115] = 1;
            }
            if (global.flag[115] == 1 && global.flag[241] >= 5)
            {
                global.msg[0] = stringsetloc("\\E1* You already opened the door...?/", "obj_shop1_slash_Draw_0_gml_493_0");
                global.msg[1] = stringsetloc("\\E2* Ha ha ha..^1. I almost wish I could watch^1! Tell me what happens!/", "obj_shop1_slash_Draw_0_gml_494_0");
                global.msg[2] = stringsetloc("\\E2* Ha ha ha..^1. though^1, I suppose if you don't come back^1, I'll understand^1, too!/%", "obj_shop1_slash_Draw_0_gml_495_0");
            }
            if (global.flag[115] == 1 && global.flag[241] >= 6)
            {
                global.msg[0] = stringsetloc("\\E1* You defeated him!^1? You REALLY defeated him!?/", "obj_shop1_slash_Draw_0_gml_500_0");
                global.msg[1] = stringsetloc("\\E0* I see..^1. perhaps you three may truly be \"Heroes\" after all.../", "obj_shop1_slash_Draw_0_gml_501_0");
                global.msg[2] = stringsetloc("\\E1* But JEVIL was just a taste of what you'll face from now on./", "obj_shop1_slash_Draw_0_gml_502_0");
                global.msg[3] = stringsetloc("\\E0* One day soon.../", "obj_shop1_slash_Draw_0_gml_503_0");
                global.msg[4] = stringsetloc("\\E1* You too^1, will begin to realize the futility of your actions./", "obj_shop1_slash_Draw_0_gml_504_0");
                global.msg[5] = stringsetloc("\\E2* Ha ha ha.../", "obj_shop1_slash_Draw_0_gml_505_0");
                global.msg[6] = stringsetloc("\\E0* At that time^1, feel free to come back here^1.&* I'll make you tea.../", "obj_shop1_slash_Draw_0_gml_506_0");
                global.msg[7] = stringsetloc("\\E2* And we can toast..^1. to the end of the world!/%", "obj_shop1_slash_Draw_0_gml_507_0");
            }
        }
        if (sell == 10)
        {
            talk_counter++;
            if (talk_counter == 1)
            {
                scr_speaker("seam");
                msgsetloc(0, "* There are many fresh faces in town^1, I see./", "obj_shop1_slash_Draw_0_gml_654_0");
                msgnextloc("\\E2* It warms this old fluff to see such hope./", "obj_shop1_slash_Draw_0_gml_655_0");
                msgnextloc("\\E3* I was even surprised to see the Queen again./", "obj_shop1_slash_Draw_0_gml_656_0");
                msgnextloc("\\E0* Same as ever..^1. Well^1, aren't we all./%", "obj_shop1_slash_Draw_0_gml_657_0");
            }
            else
            {
                scr_speaker("seam");
                if (scr_get_total_recruits(2) >= 9)
                {
                    msgsetloc(0, "* Those young men have made an interesting shop./", "obj_shop1_slash_Draw_0_gml_661_0");
                    msgnextloc("\\E3* They're leaving the bagel business^1, so I have the rest of their remaining stock./", "obj_shop1_slash_Draw_0_gml_662_0");
                }
                else
                {
                    msgsetloc(0, "* Those three young musical men are thinking about setting up a shop here./", "obj_shop1_slash_Draw_0_gml_674_0_b");
                    msgnextloc("\\E2* I'm sure you'd appreciate having an option other than me^1, ha ha./", "obj_shop1_slash_Draw_0_gml_675_0_b");
                }
                msgnextloc("\\E3* ..^1. By the by^1, it's growing late^1, isn't it?/", "obj_shop1_slash_Draw_0_gml_663_0");
                msgnextloc("\\E0* You should hurry home once you finish your business here./", "obj_shop1_slash_Draw_0_gml_664_0");
                msgnextloc("\\E3* You don't want to get caught when the sun goes down.../%", "obj_shop1_slash_Draw_0_gml_665_0");
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
