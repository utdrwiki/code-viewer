var _xstart = 0;
var _ystart = 0;
switch (char_state)
{
    case "init":
        char_state = "idle";
        break;
    case "idle":
        char_x = 0;
        hit = 0;
        armindex = 0;
        if (insta)
        {
            timerc = 8 + irandom(25);
            if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true && obj_tenna_zoom.minigameinsanitytimermax <= 40)
                timerc = 45;
            yextra = 0;
            char_y = 0;
            headangle = 0;
            bodyangle = 0;
            armangle = -10;
            drawinfront = true;
            image_index = 3;
            insta = false;
        }
        if (timerc < 70)
            timerc++;
        if (timerc < 16)
        {
            yextra = lerp(-120, 0, timerc / 15);
            char_y = lerp(char_y + 60, (_xstart - 0) + yextra, timerc / 15);
            headangle = lerp(-15, 0, timerc / 15);
            bodyangle = lerp(-10, 0, timerc / 15);
        }
        if (timerc > 2 && image_index < 3)
        {
            image_index += (1/3);
            if (image_index == 1)
            {
                snd_stop(snd_board_throw);
                snd_play_x(snd_board_throw, 0.5, 1.3 + random_range(-0.1, 0.3));
            }
        }
        if (timerc == 10)
            drawinfront = true;
        if (timerc > 3 && timerc < 19)
            armangle = lerp(armangle, -10, (timerc - 3) / 15);
        if ((i_ex(obj_tenna_minigame_ui) && obj_tenna_minigame_ui.timer > 254) || (i_ex(obj_tenna_zoom) && obj_tenna_zoom.con != 1 && obj_tenna_zoom.minigameinsanity == false))
        {
            char_state = "preoutro";
            char_timer = -1;
            timerc = 0;
        }
        else if (timerc == 70 || insta)
        {
            char_state = "shoot";
            char_timer = -1;
            timerc = 0;
        }
        break;
    case "shoot":
        timerc++;
        if (timerc == 1)
        {
            armindex = 1;
            armangle = -15;
            var gunx = x - 60;
            var guny = y + 60;
            var shot = instance_create_depth(gunx, guny, -9999, obj_shootout_vfx_mockup_shot);
            shot.enemy = 1;
            shot.targetx = camerax() + 120;
            shot.targety = cameray() + 310;
            shot.sprite_index = spr_smallbullet;
            with (obj_shootout_controller)
                krishit = true;
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
        if (timerc == 2)
        {
            armindex = 0;
            armangle = -80;
            headangle = 15;
            bodyangle = 15;
        }
        headangle = lerp(headangle, 0, timerc / 15);
        bodyangle = lerp(bodyangle, 0, timerc / 15);
        armangle = lerp(armangle, 0, timerc / 15);
        if (timerc == 10)
        {
            char_state = "preoutro";
            char_timer = -1;
            timerc = 0;
        }
        break;
    case "hit":
        timerc++;
        if (timerc == 1)
        {
            headangle = -20;
            bodyangle = -20;
            armangle = -10;
            char_x = _xstart + 21;
            char_y = 0;
            if (i_ex(obj_shootout_controller))
            {
                if (obj_shootout_controller.totalhits > 8)
                    scr_tenna_add_score(1);
                else if (obj_shootout_controller.totalhits > 4)
                    scr_tenna_add_score(2);
                else
                    scr_tenna_add_score(3);
                obj_shootout_controller.totalhits++;
            }
        }
        if (timerc == 2)
            char_x = _xstart - 18;
        if (timerc == 3)
            char_x = _xstart + 15;
        if (timerc == 4)
            char_x = _xstart - 12;
        if (timerc == 5)
            char_x = _xstart + 9;
        if (timerc == 6)
            char_x = _xstart - 6;
        if (timerc == 7)
            char_x = _xstart + 3;
        if (timerc == 8)
            char_x = _xstart;
        if (timerc > 10)
        {
            char_y = lerp(char_y, _ystart + 90, (timerc - 10) / 10);
            drawinfront = false;
            if (image_index > 0.4)
                image_index -= (1/3);
            else
                image_index = 0;
        }
        if (timerc > 20)
        {
            timerc = 0;
            char_state = "outro";
            char_timer = -1;
        }
        break;
    case "preoutro":
        timerc++;
        char_y = lerp(char_y, _ystart + 90, timerc / 10);
        if (image_index > 0.4)
            image_index -= (1/3);
        else
            image_index = 0;
        drawinfront = false;
        if (timerc == 10)
        {
            char_state = "outro";
            char_timer = -1;
            timerc = 0;
        }
        break;
    case "outro":
        state = "closing";
        timer = 0;
        timerc = 0;
        break;
}
var _col = 16777215;
if (char_state == "idle" && timerc > 35)
    _col = merge_color(c_white, c_red, (timerc - 35) / 35);
if (char_state == "idle" && timerc < 3)
    exit;
if (char_state == "hit")
{
    draw_sprite_ext(spr_shootout_tenna_hit, 0, (char_x - 5) + sprite_xoffset, (char_y - 8) + sprite_yoffset, scale, scale, 0, image_blend, 1);
    exit;
}
draw_sprite_ext(spr_shootout_tenna_shoot_pieces, 0, char_x + sprite_xoffset, char_y + sprite_yoffset, scale, scale, headangle, _col, 1);
draw_sprite_ext(spr_shootout_tenna_shoot_pieces, 1, char_x + sprite_xoffset, char_y + sprite_yoffset, scale, scale, bodyangle, _col, 1);
draw_sprite_ext(spr_shootout_tenna_shoot_pieces2, armindex, char_x + (8 * scale) + sprite_xoffset, char_y + (6 * scale) + sprite_yoffset, scale, scale, armangle, _col, 1);
