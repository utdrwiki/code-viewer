draw_sprite_ext(spr_susiezilla_ui, 0, 0, (cameray() + cameraheight()) - 132, 2, 2, 0, c_white, 1);
obj_susiezilla.health_count_prev_timer -= 1;
if (obj_susiezilla.health_count_prev_timer < 1 && obj_susiezilla.health_count_prev > obj_susiezilla.health_count)
{
    obj_susiezilla.health_count_prev -= 8;
    if (obj_susiezilla.health_count_prev < obj_susiezilla.health_count)
        obj_susiezilla.health_count_prev = obj_susiezilla.health_count;
}
draw_healthbar(444, ((cameray() + cameraheight()) - 130) + 16, 608, ((cameray() + cameraheight()) - 130) + 32, obj_susiezilla.health_count_prev / 10, c_gray, c_red, c_red, 255, true, false);
draw_healthbar(444, ((cameray() + cameraheight()) - 130) + 16, 608, ((cameray() + cameraheight()) - 130) + 32, obj_susiezilla.health_count / 10, c_gray, c_lime, c_lime, 65280, false, false);
scr_84_set_draw_font("main");
draw_set_halign(fa_right);
draw_text_ext_transformed(610, ((cameray() + cameraheight()) - 130) + 80, string(obj_susiezilla.susiezilla_score), 300, 300, 2, 2, 0);
draw_set_halign(fa_left);
var susie_icon_index = 0;
if (obj_susiezilla.hurtcon > 0)
    susie_icon_index = 1;
draw_sprite(spr_susiezilla_icon, susie_icon_index, 418 + ((obj_susiezilla.x / 1920) * 200), 416);
if (camerax_target != camerax() && move_camera_con == 1)
{
    siner++;
    _index += 0.066;
    if (waittoolongtimer >= 900)
    {
        siner += 3;
        _index += 0.066;
        draw_sprite(spr_susiezilla_moveit_angry, _index, (camerawidth() - 100) + (sin(siner / 3) * 3), cameray() + 100);
    }
    else
    {
        draw_sprite(spr_susiezilla_moveit, _index, (camerawidth() - 100) + (sin(siner / 3) * 3), cameray() + 100);
    }
    if (_index > 2)
    {
        _index = 0;
        snd_play(snd_scissorbell);
    }
    waittoolongtimer++;
    if (waittoolongtimer >= 900)
    {
        var swordzombie = false;
        for (var i = 0; i < instance_number(obj_susiezilla_zombie); i++)
        {
            zombie[i] = instance_find(obj_susiezilla_zombie, i);
            if (zombie[i].sprite_index == spr_susiezilla_zombie_giantsword)
                swordzombie = true;
        }
        if (swordzombie == false)
        {
            zombo = instance_create(camerax() - 25, 259, obj_susiezilla_zombie);
            zombo.sprite_index = spr_susiezilla_zombie_giantsword;
        }
    }
}
else
{
    waittoolongtimer = 0;
}
if (scr_debug() && show_hitboxes)
{
    draw_set_color(c_blue);
    with (obj_susiezilla_object)
    {
        if (object_index == obj_susiezilla)
            continue;
        draw_set_alpha(0.25);
        ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
        draw_set_alpha(1);
        if (height != 0)
            ossafe_fill_rectangle(x, y - height, x + 1, y, false);
        ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    }
    draw_set_color(c_purple);
    with (obj_susiezilla)
    {
        draw_set_alpha(0.25);
        ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
        draw_set_alpha(1);
        if (height != 0)
            ossafe_fill_rectangle(x, y - height, x + 1, y, false);
        ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    }
    draw_set_color(c_yellow);
    with (obj_susiezilla_collectible)
    {
        draw_set_alpha(0.25);
        ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
        draw_set_alpha(1);
        ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    }
    draw_set_color(c_red);
    with (obj_susiezilla_enemy_hitbox)
    {
        draw_set_alpha(0.25);
        ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
        draw_set_alpha(1);
        ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    }
    with (obj_susiezilla_player_hitbox)
    {
        draw_set_alpha(0.25);
        ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
        draw_set_alpha(1);
        ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    }
}
