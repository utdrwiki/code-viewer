if (stack_height > 0)
{
    var _food = food[stack_height - 1];
    with (target)
    {
        if ((other.stack_height % 2) != 0 || other.ticks >= 8)
        {
            with (instance_create_depth(x, y, depth - 1, obj_chefs_vfx))
            {
                sprite_index = other.sprite_index;
                image_index = other.image_index;
                image_speed = other.image_speed;
                image_xscale = other.image_xscale;
                image_yscale = other.image_yscale;
                white = true;
                alarm[0] = 1;
                image_alpha = 0.6;
                if (i_ex(obj_chefs_customer) && obj_chefs_customer.tenna)
                {
                    sprite_index = spr_tenna_grasp_chef;
                    image_index = 1;
                }
            }
        }
        speed = 0;
        scr_tenna_add_score(5);
        foods_needed--;
        if (i_ex(_food))
            _food.eaten = 1;
        if (special && i_ex(_food))
            _food.eaten = 2;
        snd_stop(snd_foodscore);
        var _p = 1 + (foods / 20);
        if (special)
            _p += 1;
        snd_play_pitch(snd_foodscore, _p);
        foods++;
        alarm[0] = 5;
        switch (foods)
        {
            case 1:
                foodscore = 3;
                break;
            case 2:
                foodscore = 7;
                break;
            case 3:
                foodscore = 12;
                break;
            case 4:
                foodscore = 18;
                break;
            case 5:
                foodscore = 24;
                break;
            default:
                foodscore = (foods * 8) - 16;
                break;
        }
        if (i_ex(_food))
            instance_destroy(_food);
    }
    stack_height--;
    ticks++;
    alarm[1] = 1;
    if (ticks >= 8)
        alarm[1] = 2;
    if (ticks >= 12)
        alarm[1] = 3;
    if (ticks >= 16)
        alarm[1] = 4;
}
else
{
    instance_destroy();
}
