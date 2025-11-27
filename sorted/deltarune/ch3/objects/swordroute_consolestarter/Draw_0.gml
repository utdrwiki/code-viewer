if (draw_blue)
{
    draw_set_color(#3F48CC);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + room_width, cameray() + room_height);
    draw_set_color(c_white);
    with (obj_gameshow_swordroute)
        screencolor = #3F48CC;
}
if (draw_static)
{
    statictimer += 0.5;
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + room_width, cameray() + room_height);
    var staticalpha = 0.25;
    draw_sprite_ext(spr_static_effect, statictimer, 64, 32, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer, 64, 288, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer, 320, 32, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer, 320, 288, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer - 0.25, 64, 32, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer - 0.25, 64, 288, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer - 0.25, 320, 32, 2, 2, 0, c_white, staticalpha);
    draw_sprite_ext(spr_static_effect, statictimer - 0.25, 320, 288, 2, 2, 0, c_white, staticalpha);
    with (obj_gameshow_swordroute)
        screencolor = #ADC7EB;
}
if (draw_green)
{
    draw_set_color(#B5E61D);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + room_width, cameray() + room_height);
    draw_set_color(c_white);
    with (obj_gameshow_swordroute)
        screencolor = #B5E61D;
}
if (controllerprompt)
{
    draw_set_color(c_white);
    draw_set_font(fnt_8bit);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(320, 178, string_hash_to_newline(controllertext), 1, 1, 0);
    draw_sprite_ext(spr_gameshow_nocontroller, 0, 196, 150, 2, 2, 0, c_white, 1);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
}
if (drawboxcolor)
{
    draw_set_color(drawcolor);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + room_width, cameray() + room_height);
    draw_set_color(c_white);
    with (obj_gameshow_swordroute)
        screencolor = other.drawcolor;
}
if (draw_green_intro)
{
    if (screenlerp == false)
    {
        scr_lerpvar("boxy", 0, 1, 20, 5, "in");
        screenlerp = true;
    }
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + room_width, cameray() + room_height);
    draw_set_color(c_white);
    var _amt = round((boxy * 146) / 2) * 2;
    draw_set_color(#B5E61D);
    ossafe_fill_rectangle(0, 176 - (boxy * 146), room_width, (176 + (boxy * 146)) - 1);
    draw_set_color(c_white);
    with (obj_gameshow_swordroute)
        screencolor = merge_color(c_black, #B5E61D, other.boxy);
}
if (draw_stars)
{
    startimer++;
    if ((startimer % 4) == 0)
        starindex = 1 - starindex;
    if (timer > 15)
    {
        var locx = 80;
        var locy = 80;
        var rot = 0;
        draw_sprite_ext(spr_board_star_twoframe, starindex, locx, locy, 2, 2, rot, c_white, 1);
    }
}
if (drawlogo)
    draw_sprite_ext(spr_board_game_title, 0, 172, 136, 2, 2, 0, logocolor, 1);
if (ver == 0 && global.flag[1176] != 1)
{
    if (con == 0)
    {
        shinetimer++;
        if ((shinetimer % 8) == 0)
        {
            if (image_index == 2)
                image_index = 3;
            else
                image_index = 2;
        }
        draw_sprite_ext(sprite_index, image_index, 316, 330, 2, 2, 0, c_white, 1.5 + sin(shinetimer / 30));
    }
}
if (con == 12)
{
    timer++;
    var draw1 = 0;
    var draw2 = 0;
    var draw3 = 0;
    var draw4 = 0;
    var draw5 = 0;
    var draw6 = 0;
    var draw7 = 0;
    var draw8 = 0;
    if (timer == 15)
    {
        snd_play_x(snd_wing, 0.25, 1);
        kris.sprite_index = spr_krisu_kneel;
    }
    if (timer == 45)
    {
        snd_play(snd_tv_poweron);
        draw_blue = false;
        controllerprompt = false;
        with (obj_gameshow_swordroute)
            screencolor = c_black;
    }
    if (timer == 75)
        kris.sprite_index = spr_krisu_holdcontroller;
    if (timer >= 45 && timer < 52)
        draw1 = true;
    if (timer >= 52 && timer < 61)
        draw2 = true;
    if (timer >= 61 && timer < 68)
        draw3 = true;
    if (timer >= 68 && timer < 74)
        draw4 = true;
    if (timer >= 74 && timer < 85)
        draw5 = true;
    if (timer >= 85 && timer < 90)
        draw6 = true;
    if (timer >= 90 && timer < 96)
        draw7 = true;
    if (timer >= 96 && timer < 134)
        draw8 = true;
    if (timer == 134)
    {
        safe_delete(bar1);
        safe_delete(bar2);
        draw_heart = true;
    }
    if (timer == 208)
        room_goto(roomtogoto);
    draw_set_color(#B5E61D);
    if (draw1)
        ossafe_fill_rectangle(board_tilex(0), board_tiley(4), board_tilex(6) - 1, board_tiley(12) - 1);
    if (draw2)
        ossafe_fill_rectangle(board_tilex(6), board_tiley(-1), board_tilex(12) - 1, board_tiley(4) - 1);
    if (draw3)
        ossafe_fill_rectangle(board_tilex(0), board_tiley(-1), board_tilex(6) - 1, board_tiley(4) - 1);
    if (draw4)
        ossafe_fill_rectangle(board_tilex(6), board_tiley(4), board_tilex(12) - 1, board_tiley(12) - 1);
    if (draw5)
        ossafe_fill_rectangle(board_tilex(0), board_tiley(5), board_tilex(12) - 1, board_tiley(12) - 1);
    if (draw6)
        ossafe_fill_rectangle(board_tilex(0), board_tiley(-1), board_tilex(12) - 1, board_tiley(3) - 1);
    if (draw7)
        ossafe_fill_rectangle(board_tilex(0), board_tiley(2), board_tilex(12) - 1, board_tiley(6) - 1);
    if (draw8)
    {
        ossafe_fill_rectangle(0, 0, room_width, room_height);
        var maxspeed = -24;
        var speedtime = 30;
        var waittime = 8;
        if (i_ex(bar1))
        {
            if (bar1.y < 16)
                bar1.y += 336;
        }
        else
        {
            bar1 = instance_create(board_tilex(0), 120, obj_board_marker);
            bar1.sprite_index = spr_whitepx;
            bar1.image_blend = c_black;
            bar1.image_xscale = 384;
            bar1.image_yscale = 16;
            bar1.depth = depth - 1;
            bar1.gravity = -1;
        }
        if (i_ex(bar2))
        {
            if (bar2.y < 16)
                bar2.y += 336;
        }
        else
        {
            bar2 = instance_create(board_tilex(0), 312, obj_board_marker);
            bar2.sprite_index = spr_whitepx;
            bar2.image_blend = c_black;
            bar2.image_xscale = 384;
            bar2.image_yscale = 16;
            bar2.depth = depth - 1;
            bar2.gravity = -1;
        }
    }
    if (draw_heart)
    {
        var heartsize = 1;
        if (heartsize == 1)
        {
            draw_sprite_ext(obj_board_squaretransition_heart, 0, 312, 182, 1, 1, 0, c_white, 1);
            draw_sprite_ext(obj_board_squaretransition_heart, 1, 312, 192, 1, 1, 0, c_white, 1);
        }
        if (heartsize == 2)
        {
            draw_sprite_ext(obj_board_squaretransition_heart, 0, 302, 172, 2, 2, 0, c_white, 1);
            draw_sprite_ext(obj_board_squaretransition_heart, 1, 302, 192, 2, 2, 0, c_white, 1);
        }
    }
    draw_set_color(c_white);
}
