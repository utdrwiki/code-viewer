char_timer++;
switch (char_state)
{
    case "init":
        char_timer = -1;
        char_alpha = 1;
        char_state = "idle";
        char_sprite = 4855;
        char_imgindex = 2/3;
        char_y = 40;
        char_x = 5;
        break;
    case "idle":
        if (krspopout)
        {
            if (char_imgindex < 4)
                char_imgindex += (1/3);
            if (image_index < 3)
                image_index += (1/3);
        }
        else
        {
            if (char_imgindex > 0)
                char_imgindex -= (1/3);
            if (image_index > 0)
                image_index -= (1/3);
            if (char_imgindex > 0)
                char_imgindex = 0;
            if (image_index > 0)
                image_index = 0;
        }
        break;
    case "hit":
        if (char_timer == 0)
        {
            char_alpha = 1;
            char_sprite = 601;
            if (obj_shootout_controller.shootout_type > 1)
                char_sprite = 4842;
            char_imgindex = 0;
            show_hit_spike = true;
            snd_play(snd_punchmed);
            var _hrt = scr_afterimage_grow();
            _hrt.sprite_index = spr_shootout_heart_big_outline;
            _hrt.depth = obj_shootout_controller.depth - 1;
            _hrt.fade = 0.08;
            _hrt.xrate = 0.1;
            _hrt.yrate = 0.1;
        }
        if (char_timer >= 10)
            show_hit_spike = false;
        if (char_timer >= 15)
        {
            char_state = "idle";
            char_timer = -1;
        }
        break;
}
var _char_x = (char_x + sprite_yoffset) - 72;
var _char_y = (char_y + sprite_yoffset) - 122;
if (char_imgindex >= 3)
{
    trembletimer++;
    if (trembletimer == 1)
        _char_x += 1;
    if (trembletimer == 2)
        _char_x += 1;
    if (trembletimer == 3)
        _char_x += 1;
    if (trembletimer == 4)
        _char_x += 1;
    if (trembletimer == 5)
        _char_x += -1;
    if (trembletimer == 6)
        _char_x += -1;
    if (trembletimer == 7)
        _char_x += -1;
    if (trembletimer == 8)
        _char_x += -1;
    if (trembletimer == 8)
        trembletimer = 0;
}
if (i_ex(obj_shootout_controller) && (obj_shootout_controller.invtimer == 29 || obj_shootout_controller.invtimer == 28 || obj_shootout_controller.invtimer == 25 || obj_shootout_controller.invtimer == 24 || obj_shootout_controller.invtimer == 20 || obj_shootout_controller.invtimer == 19 || obj_shootout_controller.invtimer == 16 || obj_shootout_controller.invtimer == 15 || obj_shootout_controller.invtimer == 12 || obj_shootout_controller.invtimer == 11 || obj_shootout_controller.invtimer == 8 || obj_shootout_controller.invtimer == 7 || obj_shootout_controller.invtimer == 4 || obj_shootout_controller.invtimer == 3))
{
}
else
{
    draw_sprite_ext(spr_shootout_susie_popout, char_imgindex, _char_x + _x, _char_y + _y, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_shootout_ralsei_popout, char_imgindex, _char_x + _x, _char_y + _y, 2, 2, 0, c_white, 1);
    draw_sprite_ext(char_sprite, char_imgindex, _char_x + _x, _char_y + _y, 2, 2, 0, c_white, 1);
}
