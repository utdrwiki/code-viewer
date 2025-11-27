siner++;
image_speed = 0.2;
if (scr_debug())
{
    if (keyboard_check_pressed(ord("R")))
        room_restart();
}
if (style == 3)
{
    if (judderarray[0] == 0)
    {
        for (var i = 0; i < 10; i++)
            judderarray[i] = 5 + irandom(40);
    }
    draw_set_color(#331D0A);
    ossafe_fill_rectangle(-20, -20, 660, 500, 0);
    draw_set_color(c_white);
    rotate_timer++;
    bloomdist = 0.5;
    b = bloomdist + (sin(siner / period) * amplitude);
    var tvscreenscaler = abs(sin(siner / 30) * 0.1);
    var tvglow = (tvscreenscaler * 1.5) + 0.1;
    draw_sprite_ext(spr_sepia_room_background, 0, -700, 0, 2, 2, 0, c_white, 1);
    for (var i = 0; i < 4; i++)
    {
        draw_sprite_ext(spr_sepia_room_background, 0, -700 + lengthdir_x(b, (siner * 2) + (90 * i) + 45), lengthdir_y(b, (siner * 2) + (90 * i) + 45), 2, 2, 0, c_white, 0.25 * ((i + 1) / 4));
        draw_sprite_ext(spr_sepia_room_tvStand, 0, 262, 192, 2, 2, 0, c_white, 1);
        draw_set_color(#331D0A);
        ossafe_fill_rectangle(0, 400, view_wport[0], view_hport[0], false);
        draw_set_color(c_white);
        var cloudsize = 2.5;
        for (var k = 0; k < 7; k++)
            var rotationAmt = rotate_timer * (k + 1 + 0.05) * 0.05;
    }
    draw_set_color(#331D0A);
    var circlecount = 10;
    var circdistance = 320;
    var circradius = 150;
    for (var j = 0; j < 5; j++)
    {
        for (var i = 0; i < circlecount; i++)
        {
            draw_set_alpha((j + 1) / 5);
            var rotamt = (rotate_timer / (10 * (j + 1))) * 4;
            draw_circle(320 + lengthdir_x(circdistance + (j * 10) + judderarray[i], ((i / circlecount) * 360) + rotamt), 240 + lengthdir_y(circdistance + (j * 10), ((i / circlecount) * 360) + rotamt), circradius, 0);
        }
    }
    var reopacity = 1.3;
    draw_sprite_ext(spr_sepia_dess_silhouette, 0, 355, 253, 2, 2, 0, c_white, disappear_alpha[0] * reopacity);
    draw_sprite_ext(spr_sepia_dess_silhouette, 1, 355, 253, 2, 2, 0, c_white, disappear_alpha[0] * reopacity * tvglow);
    draw_sprite_ext(spr_sepia_asriel_silhouette, 0, 215, 269, 2, 2, 0, c_white, disappear_alpha[5] * reopacity);
    draw_sprite_ext(spr_sepia_asriel_silhouette, 1, 215, 269, 2, 2, 0, c_white, disappear_alpha[5] * reopacity * tvglow);
    draw_sprite_ext(spr_sepia_kris_silhouette, 0, 265, 281, 2, 2, 0, c_white, disappear_alpha[6] * reopacity);
    draw_sprite_ext(spr_sepia_kris_silhouette, 1, 265, 281, 2, 2, 0, c_white, disappear_alpha[6] * reopacity * tvglow);
    draw_sprite_ext(spr_sepia_noelle_silhouette, 0, 310, 277, 2, 2, 0, c_white, disappear_alpha[3] * reopacity);
    draw_sprite_ext(spr_sepia_noelle_silhouette, 1, 310, 277, 2, 2, 0, c_white, disappear_alpha[3] * reopacity * tvglow);
    draw_sprite_ext(spr_sepia_carol_silhouette, 0, 380, 342, 2, 2, 0, c_white, disappear_alpha[1] * reopacity);
    draw_sprite_ext(spr_sepia_carol_silhouette, 1, 380, 342, 2, 2, 0, c_white, disappear_alpha[1] * reopacity * tvglow);
    draw_sprite_ext(spr_sepia_rudy_silhouette, 0, 330, 340, 2, 2, 0, c_white, disappear_alpha[4] * reopacity);
    draw_sprite_ext(spr_sepia_rudy_silhouette, 1, 330, 340, 2, 2, 0, c_white, disappear_alpha[4] * reopacity * tvglow);
    draw_sprite_ext(spr_sepia_asgore_silhouette, 0, 250, 324, 2, 2, 0, c_white, disappear_alpha[2] * reopacity);
    draw_sprite_ext(spr_sepia_asgore_silhouette, 1, 250, 324, 2, 2, 0, c_white, disappear_alpha[2] * reopacity * tvglow);
    draw_sprite_ext(spr_sepia_toriel_silhouette, 0, 200, 340, 2, 2, 0, c_white, disappear_alpha[7] * reopacity);
    draw_sprite_ext(spr_sepia_toriel_silhouette, 1, 200, 340, 2, 2, 0, c_white, disappear_alpha[7] * reopacity * tvglow);
    draw_sprite_ext(spr_sepia_room_foreground, 0, -300, 360, 2, 2, 0, c_white, 1);
    draw_set_alpha(blackfade);
    draw_set_color(c_black);
    ossafe_fill_rectangle(-20, -20, 660, 500, 0);
    draw_set_color(c_white);
    draw_set_alpha(1);
    for (var l = 0; l < 10; l++)
    {
        draw_sprite_ext(spr_sepia_room_tv, 0, 302, 242, 2, 2, 0, c_white, 0.7 * tvstrength);
        draw_sprite_ext(spr_sepia_room_tv, 0, 302, 242 + (tvscreenscaler * 10), 2 + ((tvscreenscaler / 2) * l), 2 + ((tvscreenscaler / 2) * l), 0, c_white, (l / 70) * tvstrength);
    }
}
