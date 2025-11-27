image_alpha += 0.1;
siner++;
var offset = sin(siner / 6) * 2;
if (character == "susie")
    targetid = 1411;
else
    targetid = 1412;
draw_set_alpha(image_alpha);
ossafe_fill_rectangle_color(targetid.x - offset, targetid.y - offset, targetid.x + 96 + offset, targetid.y + 100 + offset, c_red, c_red, c_red, c_red, true);
ossafe_fill_rectangle_color(targetid.x - 1 - offset, targetid.y - 1 - offset, targetid.x + 96 + 1 + offset, targetid.y + 100 + 1 + offset, c_red, c_red, c_red, c_red, true);
draw_set_alpha(1);
draw_sprite_ext(spr_shutta_hands, 0, targetid.x - offset, targetid.y - offset, image_xscale, image_yscale, 0, c_white, image_alpha);
draw_sprite_ext(spr_shutta_hands, 1, targetid.x + 96 + offset, targetid.y + 102 + offset, image_xscale, image_yscale, 0, c_white, image_alpha);
if (targetid.x < camerax())
    targetid.x = camerax();
if (targetid.x > ((camerax() + camerawidth()) - targetid.sprite_width))
    targetid.x = (camerax() + camerawidth()) - targetid.sprite_width;
if (targetid.y < cameray())
    targetid.y = cameray();
if (targetid.y > ((cameray() + 316) - targetid.sprite_height))
    targetid.y = (cameray() + 316) - targetid.sprite_height;
if (character == "susie")
{
    if (con == 1)
    {
        with (obj_writer)
            instance_destroy();
        scr_speaker("susie");
        msgsetloc(0, "\\E2* Hey, don't take a -- achoo!!/%", "obj_shutta_move_char_controller_slash_Draw_0_gml_36_0");
        scr_battletext();
        con = 2;
    }
    if (con == 2)
    {
        if (!i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            snd_play_volume(snd_camera_flash, 0.8);
            msgsetloc(0, "* Camenary took a bad picture... it got a little embarrassed/%", "obj_shutta_move_char_controller_slash_Draw_0_gml_46_0");
            scr_battletext_default();
            con = 3;
        }
    }
    if (con == 3)
    {
        if (alpha2 <= 0)
            instance_destroy();
        draw_set_alpha(alpha2);
        ossafe_fill_rectangle_color(targetid.x - offset, targetid.y - offset, targetid.x + 96 + offset, targetid.y + 100 + offset, c_white, c_white, c_white, c_white, false);
        draw_set_alpha(1);
        alpha2 -= 0.05;
    }
}
else
{
    if (con == 1)
    {
        snd_play_volume(snd_camera_flash, 0.8);
        with (obj_writer)
            instance_destroy();
        con = 2;
    }
    if (con == 2)
    {
        if (alpha2 <= 0)
            instance_destroy();
        draw_set_alpha(alpha2);
        ossafe_fill_rectangle_color(targetid.x - offset, targetid.y - offset, targetid.x + 96 + offset, targetid.y + 100 + offset, c_white, c_white, c_white, c_white, false);
        draw_set_alpha(1);
        alpha2 -= 0.05;
    }
}
if (left_h())
    targetid.x -= 4;
if (right_h())
    targetid.x += 4;
if (up_h())
    targetid.y -= 4;
if (down_h())
    targetid.y += 4;
if (button1_p() == 1 && con == 0)
    con = 1;
