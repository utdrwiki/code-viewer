char_timer++;
switch (char_state)
{
    case "init":
        char_timer = 0;
        char_alpha = 0;
        char_state = "idle";
        can_shoot = true;
        char_sprite = 3756;
        dog_item = 4507;
        char_imgindex = 0;
        break;
    case "idle":
        char_alpha = 1;
        char_sprite = 3756;
        char_imgindex = 0;
        char_x = sin((char_timer / 4) * speedfactor) * -6;
        char_y = sin((char_timer / 8) * speedfactor) * 2;
        if (timer >= duration)
        {
            char_state = "outro";
            char_timer = -1;
        }
        break;
    case "hit":
        char_x = 0;
        char_y = 0;
        if (char_timer == 0)
        {
            char_alpha = 1;
            char_sprite = 3756;
            char_imgindex = 0;
            show_hit_spike = true;
            snd_play(snd_bluh);
            var _item = instance_create_depth(x, y, depth - 1, obj_shootout_dog_item);
            _item.rotspd = -25;
            _item.fadespd = 0.1;
            _item.image_alpha = 2;
            _item.image_xscale = 2;
            _item.image_yscale = 2;
            _item.sprite_index = dog_item;
            _item.direction = 60 + irandom(20);
            _item.speed = 10;
            _item.gravity = 1;
            dog_item = -1;
            var _points_txt = instance_create_depth(x, y - 30, obj_shootout_controller.depth - 1, obj_shootout_text);
            _points_txt.color = c_yellow;
            _points_txt.text = "+200";
            obj_shootout_controller.points += 200;
        }
        if (char_timer > 15)
            show_hit_spike = false;
        if (char_timer >= 30)
        {
            char_state = "outro";
            char_timer = -1;
        }
        break;
    case "outro":
        char_sprite = 3756;
        char_alpha = scr_approach(char_alpha, 0, 0.1 * speedfactor);
        char_x = lerp(30, 0, char_alpha);
        char_y = 0;
        if (char_alpha < 0.5 && state != "closing")
        {
            state = "closing";
            timer = 0;
        }
        break;
}
char_x += sprite_xoffset;
char_y += sprite_yoffset;
draw_sprite_ext(char_sprite, char_imgindex, char_x, char_y, 2, 2, 0, c_white, char_alpha);
if (dog_item != -1)
    draw_sprite_ext(dog_item, 0, char_x, char_y - 6, 2, 2, sin(char_timer / 4) * -15, c_white, char_alpha);
