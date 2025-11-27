if ((room == room_board_1 || room == room_board_2 || room == room_board_3) && i_ex(obj_shootout_controller))
    exit;
if (global.chapter == 3 && i_ex(obj_susiezilla_gamecontroller))
    exit;
if (global.chapter == 3 && i_ex(obj_chefs_game))
    exit;
if (global.chapter == 3 && i_ex(obj_rhythmgame))
    exit;
if (global.chapter == 3 && i_ex(obj_shootout_controller))
    exit;
if (global.chapter == 3 && i_ex(obj_gameover_board))
    exit;
if (global.chapter == 3 && i_ex(obj_gameover_minigame))
    exit;
if (global.chapter == 3 && instance_exists(obj_knight_enemy) && obj_knight_enemy.end_cutscene_version > 0)
    exit;
if (!surface_exists(healthbar_surf))
    healthbar_surf = surface_create(96, 250);
surface_set_target(healthbar_surf);
draw_clear_alpha(c_white, 0);
if (i_ex(obj_battlecontroller) && obj_battlecontroller.rouxlsgridenabled == true && global.bmenuno == 0 && global.myfight == 0 && global.charturn == 0)
    yoffset = lerp(yoffset, -90, 0.25);
else
    yoffset = lerp(yoffset, 0, 0.25);
yy = __view_get(e__VW.YView, 0);
y = yy + 40 + yoffset;
if (i_ex(obj_shadowman_sharpshoot_cursor) && obj_shadowman_sharpshoot_cursor.disablesbattleui == true)
    y = -999;
draw_sprite(spr_tensionbar, 1, 0, 0);
if (abs(apparent - global.tension) < 20)
    apparent = global.tension;
if (apparent < global.tension)
    apparent += 20;
if (apparent > global.tension)
    apparent -= 20;
if (apparent != current)
{
    changetimer += 1;
    if (changetimer > 15)
    {
        if ((apparent - current) > 0)
            current += 2;
        if ((apparent - current) > 10)
            current += 2;
        if ((apparent - current) > 25)
            current += 3;
        if ((apparent - current) > 50)
            current += 4;
        if ((apparent - current) > 100)
            current += 5;
        if ((apparent - current) < 0)
            current -= 2;
        if ((apparent - current) < -10)
            current -= 2;
        if ((apparent - current) < -25)
            current -= 3;
        if ((apparent - current) < -50)
            current -= 4;
        if ((apparent - current) < -100)
            current -= 5;
        if (abs(apparent - current) < 3)
            current = apparent;
    }
}
if (current > 0)
{
    if (apparent < current)
    {
        draw_set_color(c_red);
        draw_rectangle(3, (0 + sprite_height) - 1, (0 + sprite_width) - 1, (0 + sprite_height) - ((current / global.maxtension) * sprite_height), false);
        draw_set_color(c_orange);
        draw_rectangle(3, (0 + sprite_height) - 1, (0 + sprite_width) - 1, (0 + sprite_height) - ((apparent / global.maxtension) * sprite_height), false);
    }
    if (apparent > current)
    {
        draw_set_color(c_white);
        draw_rectangle(3, (0 + sprite_height) - 1, (0 + sprite_width) - 1, (0 + sprite_height) - ((apparent / global.maxtension) * sprite_height), false);
        draw_set_color(c_orange);
        if (maxed == 1)
            draw_set_color(merge_color(c_yellow, c_orange, 0.5));
        draw_rectangle(3, (0 + sprite_height) - 1, (0 + sprite_width) - 1, (0 + sprite_height) - ((current / global.maxtension) * sprite_height), false);
    }
    if (apparent == current)
    {
        draw_set_color(c_orange);
        if (maxed == 1)
            draw_set_color(merge_color(c_yellow, c_orange, 0.5));
        draw_rectangle(3, (0 + sprite_height) - 1, (0 + sprite_width) - 1, (0 + sprite_height) - ((current / global.maxtension) * sprite_height), false);
    }
}
shit = 0;
try
{
    if (global.tensionselect >= 0)
        shit = 1;
}
catch (_ex)
{
    shit = 2;
}
if (shit == 2)
    snd_play(snd_splat);
if (global.tensionselect > 0)
{
    tsiner += 1;
    draw_set_color(c_white);
    draw_set_alpha(abs(sin(tsiner / 8) * 0.5) + 0.2);
    theight = (0 + sprite_height) - ((current / global.maxtension) * sprite_height);
    theight2 = theight + ((global.tensionselect / global.maxtension) * sprite_height);
    if (theight2 > ((0 + sprite_height) - 1))
    {
        theight2 = (0 + sprite_height) - 1;
        draw_set_color(c_dkgray);
        draw_set_alpha(0.7);
    }
    draw_rectangle(3, theight2, (0 + sprite_width) - 1, theight, false);
    draw_set_alpha(1);
}
else
{
    tsiner++;
}
if (apparent > 20 && apparent < global.maxtension)
    draw_sprite(spr_tensionmarker, 0, 3, (0 + sprite_height) - ((current / global.maxtension) * sprite_height));
if (room == room_board_1 || room == room_board_2 || room == room_board_3)
{
    var col = merge_color(c_white, c_yellow, abs(sin(tsiner / 8) * 0.5) + 0.1);
    var col2 = 16777215;
    if (apparent > global.rank1tp)
        col2 = col;
    draw_set_color(col);
    draw_set_color(col2);
    draw_rectangle(3, (4 + sprite_height) - ((global.rank1tp / global.maxtension) * sprite_height), (0 + sprite_width) - 1, (0 + sprite_height) - ((global.rank1tp / global.maxtension) * sprite_height), false);
    draw_sprite_ext(spr_thrash_star, 0, (x + 6) - 14, (1 + sprite_height) - ((global.rank1tp / global.maxtension) * sprite_height), 0.5, 0.5, 0, col2, 1);
    draw_set_color(c_white);
}
draw_sprite(spr_tensionbar, 0, 0, 0);
gpu_set_blendmode(bm_subtract);
draw_sprite_ext(spr_tensionbar_cutout, 0, 0, 0, 1, 1, 0, c_white, 1);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(healthbar_surf, x, y);
draw_sprite(spr_tplogo, 0, x - 30, y + 30);
draw_set_color(c_white);
scr_84_set_draw_font("mainbig");
flashsiner += 1;
tamt = floor((apparent / global.maxtension) * 100);
maxed = 0;
if (tamt < 100)
{
    draw_text(x - 30, y + 70, string_hash_to_newline(string(floor((apparent / global.maxtension) * 100))));
    draw_text(x - 25, y + 95, string_hash_to_newline(stringsetloc("%", "obj_tensionbar_slash_Draw_0_gml_18_0")));
}
if (tamt >= 100)
{
    maxed = 1;
    draw_set_color(c_yellow);
    draw_text(x - 28, y + 70, string_hash_to_newline(stringsetloc("M", "obj_tensionbar_slash_Draw_0_gml_25_0")));
    draw_text(x - 24, y + 90, string_hash_to_newline(stringsetloc("A", "obj_tensionbar_slash_Draw_0_gml_26_0")));
    draw_text(x - 20, y + 110, string_hash_to_newline(stringsetloc("X", "obj_tensionbar_slash_Draw_0_gml_27_0")));
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
