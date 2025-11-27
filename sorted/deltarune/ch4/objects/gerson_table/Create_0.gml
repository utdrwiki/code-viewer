depth = 5000;
gerson_mode = global.plot < 242;
event_active = false;
event_con = 0;
is_interacting = false;
is_talking = false;
menu_type = 1;
menu_display_type = 0;
menu_talk_flag = "";
menu_talk_style = 0;
menu_talk_con = 0;
menu_dollar = 1;
default_text = "";
menu_list = [];
item_list = [];
sidemessage_list = [stringsetloc("Shall we&choose&something?", "obj_gerson_table_slash_Create_0_gml_30_0"), stringsetloc("Umm, and&here's&change!", "obj_gerson_table_slash_Create_0_gml_31_0"), stringsetloc("Sorry,&Kris! No&money...", "obj_gerson_table_slash_Create_0_gml_32_0"), stringsetloc("No room...&Let's SELL&upstairs!", "obj_gerson_table_slash_Create_0_gml_33_0"), stringsetloc("Whee!&Into our&STORAGE!", "obj_gerson_table_slash_Create_0_gml_34_0")];
if (gerson_mode)
    sidemessage_list = [stringsetloc("What are&ya lookin&for?", "obj_gerson_table_slash_Create_0_gml_40_0"), stringsetloc("Thanks!&Wa ha ha.", "obj_gerson_table_slash_Create_0_gml_41_0"), stringsetloc("You're a&bit short&on cash.", "obj_gerson_table_slash_Create_0_gml_42_0"), stringsetloc("You're&carrying&too much!", "obj_gerson_table_slash_Create_0_gml_43_0"), stringsetloc("Sent to&your&STORAGE!", "obj_gerson_table_slash_Create_0_gml_44_0")];
event_user(1);
for (var i = 0; i < 10; i++)
{
    item[i] = 0;
    itemtype[i] = "item";
    shopdesc[i] = "";
}
for (var i = 0; i < array_length(item_list); i++)
{
    var current_item = item_list[i];
    item[i] = current_item.item_id;
    itemtype[i] = current_item.item_type;
    shopdesc[i] = current_item.item_desc;
    buyvalue[i] = current_item.point_value;
    itematk[i] = 0;
    itemdef[i] = 0;
    itemmagic[i] = 0;
    canequip[i][1] = 0;
    canequip[i][2] = 0;
    canequip[i][3] = 0;
    dollar_value[i] = -1;
    if (current_item.item_type == "item")
    {
        scr_iteminfo(item[i]);
        shopitemname[i] = itemnameb;
        dollar_value[i] = value;
    }
    if (current_item.item_type == "armor")
    {
        scr_armorinfo(item[i]);
        shopitemname[i] = armornametemp;
        itemdef[i] = armordftemp;
        canequip[i][1] = armorchar1temp;
        canequip[i][2] = armorchar2temp;
        canequip[i][3] = armorchar3temp;
        dollar_value[i] = value;
    }
    if (current_item.item_type == "weapon")
    {
        scr_weaponinfo(item[i]);
        itematk[i] = weaponattemp;
        itemmagic[i] = weaponmagtemp;
        shopitemname[i] = weaponnametemp;
        canequip[i][1] = weaponchar1temp;
        canequip[i][2] = weaponchar2temp;
        canequip[i][3] = weaponchar3temp;
        dollar_value[i] = value;
    }
    if (current_item.item_type == "key")
    {
        scr_keyiteminfo(item[i]);
        shopitemname[i] = tempkeyitemname;
    }
    if (current_item.item_type == "event")
    {
        shopitemname[i] = current_item.item_id;
        price_label[i] = current_item.price_label;
        sold_flag[i] = current_item.sold_flag;
    }
    if (menu_dollar)
        buyvalue[i] = dollar_value[i];
}
event_user(0);
idletimer = 0;
idlefacer = 0;
talkfacer = 0;
talkbuffer = 0;
menu = 0;
submenu = 0;
global.typer = 6;
draw_set_color(c_white);
scr_84_set_draw_font("mainbig");
talktimer = 0;
cur_jewel = 0;
shopcharx = 0;
siner = 0;
for (var i = 0; i < 20; i += 1)
{
    menuc[i] = 0;
    submenuc[i] = 0;
}
onebuffer = 0;
twobuffer = 0;
upbuffer = 0;
downbuffer = 0;
hold_up = 0;
hold_down = 0;
_up_pressed = 0;
_down_pressed = 0;
murder = 0;
moff = 415;
menu = 1;
menuc[0] = 0;
menuc[1] = 0;
menuc[2] = 0;
menuc[3] = 0;
menuc[4] = 0;
item0pic = spr_heart;
item1pic = spr_heart;
item2pic = spr_heart;
item3pic = spr_heart;
itemtotal = array_length(item_list);
sell = 0;
bought = 0;
mainmessage = 0;
minimenuy = 220;
global.typer = 23;
scr_84_set_draw_font("mainbig");
sidemessage = 0;
selling = 0;
global.msc = 0;
glow = 0;
shx = 130;
soldo = 0;
global.faceemotion = 0;
an = 0;
talk_counter = 0;
