if (global.flag[1226] == 1)
    exit;
siner++;
var xx = camerax();
var yy = cameray();
var space = 10;
xx = camerax() + 60 + 52;
yy = (cameray() + 16) - 31;
draw_sprite_tiled_ext(spr_dw_tv_starbgtile, siner / 2, camerax() + siner, cameray() + -siner, 2, 2, c_white, bgalpha);
if ((gacha_con == 3.5 && i_ex(numentry)) || drawblue)
{
    if (scr_debug())
    {
        if (keyboard_check_pressed(vk_numpad9))
        {
            with (numentry)
                num = 1225;
        }
    }
    if (!drawblue)
        bgalpha = lerp(bgalpha, 1, 0.25);
    if (drawblue)
        draw_sprite_ext(spr_pxwhite, 0, camerax(), cameray(), 640, 480, 0, #101058, 1);
    if (i_ex(numentry))
        cur_jewel = numentry.cur_jewel;
    scr_darkbox_black(((xx + 128) - 80 - 20 - 10) + 4, yy + 164 + 2, xx + 389 + 4, yy + 2 + 281 + 40 + 20);
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    var wager = stringsetloc("POINTs TO SPEND:", "obj_room_ranking_b_slash_Draw_0_gml_38_0");
    var points = stringsetloc("HELD POINTs:", "obj_room_ranking_b_slash_Draw_0_gml_39_0");
    var goldchance = stringsetloc("GOLD CHANCE:", "obj_room_ranking_b_slash_Draw_0_gml_40_0");
    var nogold = false;
    var remainingSuperPrize = 5 - (global.flag[1177] + global.flag[1178] + global.flag[1179] + global.flag[1180] + global.flag[1181]);
    if (remainingSuperPrize == 0)
        nogold = true;
    if (nogold)
        goldchance = stringsetloc("NO MORE GOLD", "obj_room_ranking_b_slash_Draw_0_gml_47_0");
    var lastgold = stringsetloc("SINCE LAST GOLD:", "obj_room_ranking_b_slash_Draw_0_gml_41_0");
    space = 24;
    var textreloc = 190;
    var textloc = yy + textreloc;
    var textxloc = (xx + 320) - 60;
    draw_set_halign(fa_right);
    draw_text(textxloc, textloc + (space * 0), wager);
    var off = 0;
    if (global.lang == "ja")
        off = 8;
    draw_text(textxloc, textloc + (space * 1) + off, points);
    draw_set_color(#F3E267);
    if (drawblue)
        draw_set_color(c_white);
    if (!nogold)
    {
        off = 0;
        if (global.lang == "ja")
            off = 0;
        draw_text(textxloc, textloc + (space * 3) + off, goldchance);
    }
    else
    {
        draw_set_color(c_gray);
        draw_set_halign(fa_center);
        draw_text(camerax() + 320, textloc + (space * 3.5) + off, goldchance);
        draw_set_halign(fa_right);
        draw_set_color(-1);
    }
    if (!nogold)
    {
        off = 0;
        if (global.lang == "ja")
            off = 4;
        draw_text(textxloc, textloc + (space * 4) + off, lastgold);
    }
    draw_set_color(c_white);
    var heldpoints = global.flag[1044] - numentry.num;
    if (heldpoints < 0)
        heldpoints = 0;
    off = 0;
    if (global.lang == "ja")
        off = 8;
    draw_text(xx + 358, textloc + (space * 1) + off, string(heldpoints));
    draw_set_color(#F3E267);
    if (drawblue)
        draw_set_color(c_white);
    var lastgoldamt = string(global.flag[1182]);
    if (!nogold)
    {
        off = 0;
        if (global.lang == "ja")
            off = 4;
        draw_text(xx + 358, textloc + (space * 4) + off, lastgoldamt);
    }
    var goldchanceamt = obj_ch3_gachapon.superChanceBonusDrawAmount;
    goldchance = string(min(floor(goldchanceamt), 100)) + "%";
    if (goldchance == "100%")
        draw_set_color(c_yellow);
    if (drawblue)
        draw_set_color(c_white);
    if (!nogold)
        draw_text(xx + 358, textloc + (space * 3), goldchance);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    if (drawblue)
        draw_text(camerax() + 396, (cameray() + 183) - 8, "1225");
    if (i_ex(numentry))
    {
        numentry.xoff = 108;
        numentry.yoff = textreloc - 28 - space - 31;
    }
}
else
{
    bgalpha = lerp(bgalpha, 0, 0.5);
}
draw_set_halign(fa_left);
