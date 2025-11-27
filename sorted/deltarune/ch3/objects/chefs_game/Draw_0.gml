if (scr_debug())
{
    if (keyboard_check(vk_numpad9))
        popularity = 1;
    if (keyboard_check(vk_numpad6))
        popularity = 0.5;
    if (keyboard_check(vk_numpad5))
        popularity = 0;
    if (keyboard_check(vk_numpad8))
        timer = 99999;
}
siner++;
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_alpha(1);
get_view_xy(0);
if (!surface_exists(_surface1))
    _surface1 = surface_create(room_width, room_height);
if (!surface_exists(_surface2))
    _surface2 = surface_create(room_width, room_height);
var rainbow = false;
with (obj_chefs_customer)
{
    if (special == true)
        rainbow = true;
}
star_anim += star_anim_speed;
bg_speed -= bg_speed_max;
bg_speed_y += bg_speed_y_max;
if (bg_speed < -640)
    bg_speed += 640;
if (bg_speed_y > -480)
    bg_speed_y -= 480;
if (!rank_set)
{
    var _percent1 = popularity * 2;
    if (_percent1 > 1)
        _percent1 = 1;
    var _percent2 = (popularity - 0.5) * 2;
    _percent2 = clamp(_percent2, 0, 1);
    if (i_ex(obj_tenna_enemy))
        _percent1 = 1;
    scr_draw_sprite_tiled_area(spr_dw_tv_starbgtile_red, star_anim, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + view_wport[0], cameray() + room_height, 2, 2, c_white, 1);
    draw_set_font(fnt_8bit);
    if (i_ex(obj_tenna_enemy) && i_ex(obj_chefs_firewhip))
    {
    }
    else if (i_ex(obj_tenna_enemy))
    {
        draw_set_alpha(0.5);
        draw_set_color(#020A58);
        draw_text_transformed(326, 96, string(timer), 3, 3, 0);
        draw_set_alpha(1);
        draw_set_color(merge_color(c_gray, c_aqua, 0.5));
        draw_text_transformed(320, 90, string(timer), 3, 3, 0);
    }
    else
    {
        dstep = 0;
        event_user(3);
    }
    surface_set_target(_surface1);
    draw_clear_alpha(c_white, 0);
    scr_draw_sprite_tiled_area(spr_dw_tv_starbgtile, star_anim, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + view_wport[0], cameray() + room_height, 2, 2, c_white, 1);
    introtimer++;
    if (!i_ex(obj_tenna_enemy))
    {
        if (introtimer == 1 || introtimer == 31 || introtimer == 61 || introtimer == 91)
            snd_play_x(snd_bell, 1, 1);
    }
    if (introtimer == 91 && !i_ex(obj_tenna_enemy))
    {
        global.currentsong[0] = snd_init("minigame_kart.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1.055);
        with (obj_chef_controls_ui)
            con = 1;
    }
    draw_set_font(fnt_8bit);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    var _drawtype = 0;
    if (i_ex(obj_tenna_enemy))
        _drawtype = 2;
    if (i_ex(obj_tenna_enemy) && i_ex(obj_chefs_firewhip))
        _drawtype = 3;
    if (_drawtype == 0)
    {
        var num = "3";
        if (introtimer > 31)
            num = "2";
        if (introtimer > 61)
            num = "1";
        if (introtimer > 91)
            num = stringsetloc("GO!!!", "obj_chefs_game_slash_Draw_0_gml_113_0");
        if (introtimer < 121)
        {
            draw_set_halign(fa_center);
            draw_set_color(#020A58);
            draw_set_alpha(0.8);
            draw_text_transformed(326, 96, num, 3, 3, 0);
            draw_set_color(c_white);
            draw_set_alpha(1);
            draw_text_transformed(320, 90, num, 3, 3, 0);
            draw_set_halign(fa_left);
        }
        else
        {
            dstep = 1;
            event_user(3);
        }
    }
    if (_drawtype == 2)
    {
        draw_set_alpha(0.5);
        draw_set_color(#020A58);
        draw_text_transformed(326, 96, string(timer), 3, 3, 0);
        draw_set_alpha(1);
        draw_set_color(merge_color(c_gray, c_aqua, 0.5));
        draw_text_transformed(320, 90, string(timer), 3, 3, 0);
    }
    draw_set_blend_mode(bm_subtract);
    draw_set_color(c_black);
    draw_sprite_ext(spr_dw_tv_starbgtile, 0, 100 + (_percent1 * 2 * 214), 0, 6, 3, 0, c_white, 1);
    draw_set_color(c_white);
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
    draw_surface_ext(_surface1, 0, 0, 1, 1, 0, c_white, 1);
    surface_set_target(_surface2);
    draw_clear_alpha(c_white, 0);
    scr_draw_sprite_tiled_area(spr_dw_tv_starbgtile_teal, star_anim, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + view_wport[0], cameray() + room_height, 2, 2, c_white, 1);
    dstep = 2;
    event_user(3);
    draw_set_blend_mode(bm_subtract);
    draw_set_color(c_black);
    draw_sprite_ext(spr_dw_tv_starbgtile, 0, 100 + (_percent2 * 2 * 214), 0, 6, 3, 0, c_white, 1);
    draw_set_color(c_white);
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
    draw_surface_ext(_surface2, 0, 0, 1, 1, 0, c_white, 1);
}
else
{
    scr_draw_sprite_tiled_area(spr_dw_tv_starbgtile, star_anim, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + view_wport[0], cameray() + room_height, 2, 2, c_white, 1);
}
if (introtimer <= 1)
    scr_draw_sprite_tiled_area(spr_dw_tv_starbgtile, star_anim, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + view_wport[0], cameray() + room_height, 2, 2, c_white, 1);
if (i_ex(obj_chef_laser_easteregg1))
{
    with (obj_chef_laser_easteregg1)
        draw_self();
}
if (i_ex(obj_chef_laser_easteregg2))
{
    with (obj_chef_laser_easteregg2)
    {
        if (timer > 40)
            hspeed -= 0.11;
        var a = 0;
        if (timer >= 70 && timer < 80)
            image_alpha2 += 0.1;
        if (timer > 90)
        {
            image_alpha2 -= 0.02;
            image_alpha -= 0.2;
        }
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        d3d_set_fog(true, c_white, 0, 0);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha2);
        d3d_set_fog(false, c_white, 0, 0);
    }
}
if (i_ex(obj_animation))
{
    with (obj_animation)
    {
        if (sprite_index == spr_realisticexplosion)
            draw_sprite(spr_realisticexplosion, image_index, x, y);
    }
}
var shakex = 0;
var shakey = 0;
if (i_ex(obj_shake))
    shakey = obj_shake.shakey * obj_shake.shakesign;
draw_sprite_ext(spr_dw_kitchen_wall, 0, vx + shakex, vy + shakey, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_chefs_burner, flashtimer / 6, 66, 226, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_chefs_burner, flashtimer / 6, 574, 226, 2, 2, 0, c_white, 1);
flashtimer++;
i = 0;
repeat (14)
{
    var _image_blend = 0;
    if (((timer * 1.5) + 2) > (150 - (i * 10)))
        _image_blend = 65535;
    if (rainbow)
    {
        _image_blend = _c[_l[i]];
        if ((flashtimer % 4) == 0)
            _l[i]++;
        if (_l[i] > 6)
            _l[i] = 0;
    }
    if (gameover)
        draw_sprite_ext(spr_chefs_hudscreen3, 0, 98 + (i * 33), 30, 2, 2, 0, c_black, 1);
    if (timer <= 10)
    {
        draw_sprite_ext(spr_chefs_hudscreen3, 0, 98 + (i * 33), 30, 2, 2, 0, c_black, 1);
        draw_sprite_ext(spr_chefs_hudscreen4, 0, 98 + (i * 33), 30, 2, 2, 0, c_white, 0.6 + (sin(flashtimer / 4) / 3));
    }
    else if (_image_blend == 16777215)
    {
        draw_sprite_ext(spr_chefs_hudscreen3, 0, 98 + (i * 33), 30, 2, 2, 0, _image_blend, image_alpha);
    }
    else
    {
        draw_sprite_ext(spr_chefs_hudscreen4, 0, 98 + (i * 33), 30, 2, 2, 0, _image_blend, image_alpha);
    }
    i++;
}
if (gameover)
{
    draw_set_font(fnt_8bit);
    draw_set_color(c_white);
    if (room != room_dw_chef && !i_ex(obj_tenna_enemy))
        draw_text(320, 60, "Push [BUTTON_3] to retry");
    if (rank_set)
    {
        var finish = stringsetloc("FINISH!", "obj_chefs_game_slash_Draw_0_gml_207_0");
        draw_set_font(fnt_8bit);
        draw_set_halign(fa_center);
        draw_set_color(#020A58);
        draw_set_alpha(0.8);
        draw_text_transformed(340, 96, finish, 3, 3, 0);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_text_transformed(334, 90, finish, 3, 3, 0);
        draw_set_halign(fa_left);
    }
    endtimer++;
    if (endtimer == 1 || endtimer == 8 || endtimer == 15)
        snd_play(snd_coin);
    if (endtimer == 1)
    {
        with (obj_chefs_customer)
        {
            movespeed = 0;
            moves = 0;
            image_speed = 0;
            speed = 0;
            xstart = x;
        }
        with (obj_chefs_food)
        {
            vspeed = 0;
            mask_index = spr_nothing;
        }
        with (obj_chefs_fire)
            instance_destroy();
    }
    with (obj_chefs_customer)
        x = xstart;
    if (endtimer == 60)
    {
        with (obj_chefs_customer)
        {
            leaving = true;
            hspeed = 0;
            vspeed = 5;
            sprite_index = sprLeave;
            image_speed = 1;
            alarm[0] = -1;
        }
    }
}
