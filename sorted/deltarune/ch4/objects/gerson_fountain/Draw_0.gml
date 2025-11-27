depth = 5000;
if (!is_interacting)
    exit;
if (global.interact == 0)
    global.interact = 1;
if (is_talking)
{
    if (!d_ex())
        is_talking = false;
    else
        exit;
}
else if (d_ex())
{
    exit;
}
if (menu_display_type == 0)
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
talkbuffer -= 1;
draw_set_color(c_black);
scr_shopmenu(0);
if (menu_display_type == 0)
{
    scr_darkbox_black(camerax(), cameray() + 240, camerax() + 415, cameray() + 480);
    scr_darkbox_black(camerax() + 400, cameray() + 240, camerax() + 640, cameray() + 480);
}
else if (menu_display_type == 1)
{
    scr_darkbox_black(camerax(), cameray() + 240, camerax() + 640, cameray() + 480);
}
if (menu == 0)
{
    sidemessage = 0;
    menuc[1] = 0;
    menuc[2] = 0;
    menuc[3] = 0;
    menuc[4] = 0;
    menu_display_type = 0;
    if (instance_exists(obj_writer) == false)
    {
        global.typer = 6;
        global.msg[0] = default_text;
        instance_create(camerax() + 30, cameray() + 270, obj_writer);
    }
    menumax = array_length(menu_list) - 1;
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    for (var i = 0; i < array_length(menu_list); i++)
        draw_text(camerax() + 480, cameray() + ((130 + (i * 20)) * 2), string_hash_to_newline(menu_list[i].option_text));
    menuc[0] = min(menuc[0], menumax);
    draw_sprite(spr_heart, 0, camerax() + 450, cameray() + ((135 + (menuc[0] * 20)) * 2));
    if (button1_p() && onebuffer < 0)
    {
        onebuffer = 2;
        mainmessage = 1;
        with (obj_writer)
            instance_destroy();
        menu = menu_list[menuc[0]].menu_type;
        if (menu == 99)
        {
            alarm[10] = 1;
            exit;
        }
        else
        {
            menu_list[menuc[0]].times_selected++;
            menu_display_type = 0;
            if (menu == 4 || menu == 6)
            {
                menu_talk_flag = menu_list[menuc[0]].talk_flag;
                menu_talk_style = menu_list[menuc[0]].talk_style;
                menu_display_type = 1;
                menu_talk_con = 0;
            }
        }
    }
}
if (menu == 4 || menu == 6)
{
    if (instance_exists(obj_writer) == false && menu_talk_con == 0)
    {
        talk_counter = menu_list[menuc[0]].times_selected;
        event_user(2);
        if (menu_talk_style == 1)
            d_make();
        else if (menu_talk_style == 2)
            alarm[10] = 1;
        else
            instance_create(camerax() + 30, cameray() + 270, obj_writer);
        is_talking = true;
        menu_talk_con = 1;
    }
    if (menu_talk_con == 1 && instance_exists(obj_writer) == false)
    {
        if (event_active)
        {
            event_active = false;
            event_con = 0;
        }
        if (menu == 4)
        {
            menu = 0;
            menu_talk_con = 0;
        }
        if (menu == 6)
        {
            menu_display_type = 99;
            if (!d_ex())
            {
                menu = 0;
                menu_talk_con = 0;
                alarm[10] = 1;
                exit;
            }
        }
    }
}
if (menu == 10)
{
    menuc[11] = 0;
    menuc[12] = 0;
    menuc[13] = 0;
    menumax = 3;
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    draw_text(camerax() + 80, cameray() + 260, string_hash_to_newline(stringsetloc("Toss unwanted item", "obj_gerson_fountain_slash_Draw_0_gml_390_0")));
    draw_text(camerax() + 80, cameray() + 300, string_hash_to_newline(stringsetloc("Toss unwanted weapon", "obj_gerson_fountain_slash_Draw_0_gml_391_0")));
    draw_text(camerax() + 80, cameray() + 340, string_hash_to_newline(stringsetloc("Toss unwanted armor", "obj_gerson_fountain_slash_Draw_0_gml_392_0")));
    draw_text(camerax() + 80, cameray() + 380, string_hash_to_newline(stringsetloc("Quit", "obj_gerson_fountain_slash_Draw_0_gml_393_0")));
    if (instance_exists(obj_writer) == false)
    {
        if (sidemessage == 0)
            global.msg[0] = stringsetloc("Select an&object.", "obj_gerson_fountain_slash_Draw_0_gml_398_0");
        if (sidemessage == 1)
            global.msg[0] = stringsetloc("Object&tossed.", "obj_gerson_fountain_slash_Draw_0_gml_399_0");
        if (sidemessage == 2)
            global.msg[0] = stringsetloc("Nothing&to toss.", "obj_gerson_fountain_slash_Draw_0_gml_400_0");
        instance_create(camerax() + 460, cameray() + 260, obj_writer);
    }
    menuc[10] = min(menuc[10], menumax);
    draw_sprite(spr_heart, 0, camerax() + 50, cameray() + 270 + (menuc[10] * 40));
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
            for (var i = 0; i < selltotal; i++)
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
            for (var i = 0; i < global.flag[64]; i++)
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
scr_shopmenu(4);
if (menu == 11 || menu == 12 || menu == 13 || menu == 14)
{
    if (instance_exists(obj_writer) == false)
    {
        if (sidemessage2 == 0 && (menu == 11 || menu == 14))
            global.msg[0] = stringsetloc("Select an&ITEM&to toss.", "obj_gerson_fountain_slash_Draw_0_gml_486_0");
        if (sidemessage2 == 0 && menu == 12)
            global.msg[0] = stringsetloc("Select a&WEAPON&to toss.", "obj_gerson_fountain_slash_Draw_0_gml_487_0");
        if (sidemessage2 == 0 && menu == 13)
            global.msg[0] = stringsetloc("Select an&ARMOR&to toss.", "obj_gerson_fountain_slash_Draw_0_gml_488_0");
        instance_create(camerax() + 450, cameray() + 260, obj_writer);
    }
}
scr_shopmenu(5);
if (menu == 15 || menu == 16 || menu == 17 || menu == 18)
{
    menumax = 1;
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    var y1_off = langopt(260, 290);
    var y2_off = langopt(290, 260);
    draw_text(camerax() + 460, cameray() + y1_off, string_hash_to_newline(stringsetloc("Toss it for", "obj_gerson_fountain_slash_Draw_0_gml_505_0")));
    draw_text(camerax() + 460, cameray() + y2_off, string_hash_to_newline(stringsetsubloc("$~1 ?", string(sellvalue), "obj_shop_vending_slash_Draw_0_gml_456_0")));
    draw_text(camerax() + 480, cameray() + 340, string_hash_to_newline(stringsetloc("Yes", "obj_shop_vending_slash_Draw_0_gml_457_0")));
    draw_text(camerax() + 480, cameray() + 370, string_hash_to_newline(stringsetloc("No", "obj_shop_vending_slash_Draw_0_gml_458_0")));
    menuc[menu] = min(menuc[menu], menumax);
    draw_sprite(spr_heart, 0, camerax() + 450, cameray() + 350 + (menuc[menu] * 30));
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
if (menu < itemtotal || menu >= 10)
{
    if (menu >= 10 && menu < 18)
        draw_text(camerax() + 440, cameray() + 420, "$" + string_hash_to_newline(string(global.gold)));
    else if (menu_dollar)
        draw_text(camerax() + 440, cameray() + 420, string_hash_to_newline("$" + string(global.gold)));
    else
        draw_text(camerax() + 440, cameray() + 420, string_hash_to_newline(string(global.flag[1044])) + " PTs");
    if (itemtype[menuc[1]] != "key" && itemtype[menuc[1]] != "event")
    {
        if (menu == 1 || menu == 2)
        {
            if (menuc[1] < itemtotal)
                scr_shop_space_display(menuc[1]);
        }
    }
}
onebuffer -= 1;
twobuffer -= 1;
