char_timer++;
var _extratime;
switch (char_state)
{
    case "init":
        char_timer = -1;
        char_alpha = 0;
        char_state = "idle";
        can_shoot = true;
        char_sprite = 3818;
        if (obj_shootout_controller.shootout_type > 1)
            char_sprite = 1420;
        char_imgindex = 0;
        char_y = 40;
        char_x = 5;
        break;
    case "idle":
        if (char_timer == 0)
        {
            char_sprite = 3818;
            if (obj_shootout_controller.shootout_type > 1)
                char_sprite = 1420;
            char_imgindex = 0;
            char_alpha = 1;
        }
        char_x = 0;
        hit = 0;
        if (char_y > -10 && char_sprite != 557)
        {
            char_y -= 10;
            if (char_y == 0)
                windowshaketimer = 10;
            if (char_y < -8)
                char_y = -8;
        }
        if (can_shoot)
        {
            if (char_timer > ((idle_duration / 5) - 6))
            {
                if (image_index < 3)
                    image_index += (1/3);
                if (image_index == 1)
                    snd_play_x(snd_board_throw, 0.5, 1.3 + random_range(-0.1, 0.3));
            }
            if (char_timer > (idle_duration / 3))
            {
                char_sprite = 557;
                if (obj_shootout_controller.shootout_type > 1)
                    char_sprite = 1420;
            }
            _extratime = 0;
            if (obj_shootout_controller.tutorialmode)
                _extratime = 120;
            if (obj_shootout_controller.tutorialmode && obj_shootout_controller.tutorialorder == 1)
                _extratime = 99999;
            if (difficulty_extratime != 0)
                _extratime = difficulty_extratime;
            if (char_timer >= (idle_duration + _extratime))
            {
                char_state = "aim";
                char_timer = -1;
            }
        }
        if (i_ex(obj_tenna_enemy_minigametext))
        {
            char_state = "outro";
            char_timer = -1;
        }
        break;
    case "aim":
        var _aim_duration = floor(12 - (speedfactor * 2));
        char_alpha = 1;
        char_x = 0;
        if (char_timer > (_aim_duration / 2))
        {
            char_sprite = 3425;
            if (obj_shootout_controller.shootout_type > 1)
                char_sprite = 1420;
        }
        if (char_timer >= _aim_duration)
        {
            char_state = "shoot";
            char_timer = -1;
        }
        break;
    case "shoot":
        if (char_timer == 0)
        {
            char_alpha = 1;
            can_shoot = false;
            char_sprite = 1105;
            if (obj_shootout_controller.shootout_type > 1)
                char_sprite = 532;
            char_imgindex = 0;
            with (obj_shootout_controller)
                krishit = true;
            var gunx = x - 60;
            var guny = y + 60;
            var shot = instance_create_depth(gunx, guny, -9999, obj_shootout_vfx_mockup_shot);
            shot.enemy = 1;
            shot.targetx = camerax() + 120;
            shot.targety = cameray() + 310;
            shot.sprite_index = spr_smallbullet;
            var impactfx = instance_create(gunx, guny, obj_animation);
            impactfx.sprite_index = spr_attack_slap2;
            impactfx.image_speed = 2;
            impactfx.image_xscale = 1;
            impactfx.image_yscale = 1;
            impactfx.image_blend = c_white;
            impactfx.depth = depth - 10;
            impactfx = instance_create(gunx, guny, obj_animation);
            impactfx.sprite_index = spr_attack_slap2;
            impactfx.image_speed = 1;
            impactfx.image_xscale = 1;
            impactfx.image_yscale = 1;
            impactfx.image_blend = c_red;
            impactfx.depth = depth - 10;
            for (var i = 0; i < 8; i++)
            {
                var smokefx = scr_marker(gunx, guny, spr_slidedust);
                smokefx.hspeed = random_range(-2, 8);
                smokefx.gravity_direction = 180;
                smokefx.gravity = 2 - random(0.4);
                smokefx.image_speed = 0.2;
                smokefx.image_xscale = 2 + random(1);
                smokefx.image_yscale = 2 + random(1);
                smokefx.vspeed = random_range(-4, 0);
                scr_lerp_var_instance(smokefx, "image_alpha", 0.6, 0, 12);
                scr_doom(smokefx, 12);
            }
        }
        var _shoot_duration = floor(30 - (speedfactor * 7));
        var _bullet_delay = 5;
        if (char_timer >= _shoot_duration)
        {
            char_state = "outro";
            char_timer = -1;
            char_y = -8;
        }
        break;
    case "hit":
        char_x = 0;
        char_y = 0;
        if (char_timer == 0)
        {
            char_alpha = 1;
            char_sprite = 601;
            if (obj_shootout_controller.shootout_type > 1)
                char_sprite = 4842;
            char_imgindex = 0;
            show_hit_spike = true;
            if (i_ex(obj_tenna_enemy))
            {
            }
            else
            {
                var _points_txt = instance_create_depth(x, y - 30, obj_shootout_controller.depth - 1, obj_shootout_text);
                _points_txt.color = c_yellow;
                _points_txt.text = "+1";
                with (obj_dw_points_fake_ui)
                    instance_destroy();
                points_display = instance_create(0, 0, obj_dw_points_fake_ui);
                with (points_display)
                {
                    xx -= 560;
                    yy -= 160;
                    alarm[0] = 60;
                }
                with (points_display)
                    display_points(1);
                with (points_display)
                    show_point_increase();
            }
            obj_shootout_controller.hitcount++;
            if (obj_shootout_controller.tutorialmode == true && obj_shootout_controller.hitcount == 3)
                obj_shootout_controller.windowdelay = 34;
            obj_shootout_controller.points += 100;
        }
        if (char_timer >= 10)
            show_hit_spike = false;
        if (char_timer >= 15)
        {
            char_state = "outro";
            char_timer = -1;
            char_y = -8;
        }
        break;
    case "outro":
        timerb++;
        if (timerb > 8)
        {
            char_sprite = 3818;
            if (obj_shootout_controller.shootout_type > 1)
                char_sprite = 1420;
            if (image_index > 0.4)
                image_index -= (1/3);
            else
                image_index = 0;
        }
        if (timerb == 13)
            char_y -= 2;
        if (timerb == 14)
            char_y -= 4;
        if (timerb > 14)
            char_y += 10;
        if (char_y > 50)
        {
            state = "closing";
            timer = 0;
            timerb = 0;
        }
    case "closing":
        break;
}
if (char_sprite == 601 && char_imgindex < 8)
    char_imgindex += 0.5;
if (char_sprite == 1105 && char_imgindex < 2)
    char_imgindex += 0.25;
if (char_sprite == 557 && char_imgindex < 4)
    char_imgindex += (1/3);
if (char_sprite == 557 && char_imgindex == 3)
    char_y += 8;
if (_x == 0 && (char_sprite == 557 || char_sprite == 1105 || char_sprite == 3425))
{
}
else
{
    var _col = 16777215;
    if (char_state == "idle" && char_timer > 10)
        _col = merge_color(c_white, c_red, clamp((char_timer - 10) / (idle_duration + _extratime), 0, 0.7));
    if (char_state == "aim" || char_state == "shoot")
        _col = 255;
    var _char_x = char_x + sprite_yoffset;
    var _char_y = char_y + sprite_yoffset;
    draw_sprite_ext(char_sprite, char_imgindex, _char_x + _x, _char_y + _y, 2, 2, 0, _col, 1);
}
