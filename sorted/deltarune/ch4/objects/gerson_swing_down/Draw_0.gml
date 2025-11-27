draw_self();
if (eye_con == 1)
{
    if (eye_index == 0)
    {
        afterimage = instance_create(x, y, obj_afterimage_gerson);
        afterimage.sprite_index = sprite_index;
        afterimage.image_index = image_index;
        afterimage.image_blend = image_blend;
        afterimage.image_speed = 0;
        afterimage.depth = depth;
        afterimage.image_xscale = image_xscale;
        afterimage.image_yscale = image_yscale;
        afterimage.image_angle = image_angle;
        afterimage.parentid = id;
        afterimage.vspeed = 2.5;
        afterimage.image_alpha = 0.6;
        afterimage = instance_create(x, y, obj_afterimage_gerson);
        afterimage.sprite_index = sprite_index;
        afterimage.image_index = image_index;
        afterimage.image_blend = image_blend;
        afterimage.image_speed = 0;
        afterimage.depth = depth;
        afterimage.image_xscale = image_xscale;
        afterimage.image_yscale = image_yscale;
        afterimage.image_angle = image_angle;
        afterimage.parentid = id;
        afterimage.vspeed = -2.5;
        afterimage.image_alpha = 0.6;
        afterimage = instance_create(x, y, obj_afterimage_gerson);
        afterimage.sprite_index = sprite_index;
        afterimage.image_index = image_index;
        afterimage.image_blend = image_blend;
        afterimage.image_speed = 0;
        afterimage.depth = depth;
        afterimage.image_xscale = image_xscale;
        afterimage.image_yscale = image_yscale;
        afterimage.image_angle = image_angle;
        afterimage.parentid = id;
        afterimage.hspeed = 2.5;
        afterimage.image_alpha = 0.6;
        afterimage = instance_create(x, y, obj_afterimage_gerson);
        afterimage.sprite_index = sprite_index;
        afterimage.image_index = image_index;
        afterimage.image_blend = image_blend;
        afterimage.image_speed = 0;
        afterimage.depth = depth;
        afterimage.image_xscale = image_xscale;
        afterimage.image_yscale = image_yscale;
        afterimage.image_angle = image_angle;
        afterimage.parentid = id;
        afterimage.hspeed = -2.5;
        afterimage.image_alpha = 0.6;
        snd_stop(snd_eye_telegraph);
        snd_play_pitch(snd_eye_telegraph, 1);
        if (obj_hammer_of_justice_enemy.swingdown_multitelegraph != 0)
        {
            if (obj_hammer_of_justice_enemy.swingdown_multitelegraph == 1)
            {
                inst = instance_create((obj_growtangle.x - 75) + 5, obj_growtangle.y - 13, obj_gerson_growtangle_telegraph);
                inst.image_xscale = 51;
                inst.image_yscale = 72;
                if (i_ex(obj_heart))
                    inst.depth = obj_heart.depth + 1;
                inst = instance_create(obj_growtangle.x - 18, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
                inst.image_xscale = 72;
                inst.image_yscale = 142;
                if (i_ex(obj_heart))
                    inst.depth = obj_heart.depth + 1;
            }
            if (obj_hammer_of_justice_enemy.swingdown_multitelegraph == 2)
            {
                inst = instance_create((obj_growtangle.x - 75) + 5, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
                inst.image_xscale = 142;
                inst.image_yscale = 72;
                if (i_ex(obj_heart))
                    inst.depth = obj_heart.depth + 1;
                inst = instance_create((obj_growtangle.x - 75) + 5, obj_growtangle.y + 3, obj_gerson_growtangle_telegraph);
                inst.image_xscale = 90;
                inst.image_yscale = 69;
                if (i_ex(obj_heart))
                    inst.depth = obj_heart.depth + 1;
            }
            if (obj_hammer_of_justice_enemy.swingdown_multitelegraph == 3)
            {
                inst = instance_create((obj_growtangle.x - 75) + 5, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
                inst.image_xscale = 142;
                inst.image_yscale = 142;
                if (i_ex(obj_heart))
                    inst.depth = obj_heart.depth + 1;
            }
            obj_hammer_of_justice_enemy.swingdown_multitelegraph = -1;
        }
        else if (swingdowntype == 10)
        {
            var ylocation = y + 16;
            if (ylocation < (obj_growtangle.y - 70))
                ylocation = obj_growtangle.y - 70;
            if (ylocation > obj_growtangle.y)
                ylocation = obj_growtangle.y;
            inst = instance_create((obj_growtangle.x - 75) + 5, ylocation, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 142;
            inst.image_yscale = 72;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (swingdowntype == 11)
        {
            var ylocation = obj_growtangle.y;
            inst = instance_create((obj_growtangle.x - 75) + 5, ylocation, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 142;
            inst.image_yscale = 72;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (swingdowntype == 12)
        {
            var ylocation = obj_growtangle.y - 70;
            inst = instance_create((obj_growtangle.x - 75) + 5, ylocation, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 142;
            inst.image_yscale = 72;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (swingdowntype == 13)
        {
            var ylocation = obj_growtangle.y - 13;
            inst = instance_create((obj_growtangle.x - 75) + 5, ylocation, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 142;
            inst.image_yscale = 72;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (swingdowntype == 14)
        {
            var ylocation = (obj_growtangle.y - 70) + 13;
            inst = instance_create((obj_growtangle.x - 75) + 5, ylocation, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 142;
            inst.image_yscale = 72;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (swingdowntype == 15)
        {
            var ylocation = obj_growtangle.y - 13;
            inst = instance_create((obj_growtangle.x - 75) + 5, ylocation, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 142;
            inst.image_yscale = 72;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (swingdowntype == 16)
        {
            var ylocation = (obj_growtangle.y - 70) + 13;
            inst = instance_create((obj_growtangle.x - 75) + 5, ylocation, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 142;
            inst.image_yscale = 72;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (swingdowntype == 17)
        {
            inst = instance_create(obj_growtangle.x - 53, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 70;
            inst.image_yscale = 142;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (swingdowntype == 18)
        {
            inst = instance_create(obj_growtangle.x - 18, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 72;
            inst.image_yscale = 142;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (swingdowntype == 19)
        {
            var xlocation;
            if (image_xscale < 0)
                xlocation = x + 52;
            else
                xlocation = x + 18;
            if (xlocation < (obj_growtangle.x - 70))
                xlocation = obj_growtangle.x - 70;
            if (xlocation > obj_growtangle.x)
                xlocation = obj_growtangle.x;
            inst = instance_create(xlocation, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 72;
            inst.image_yscale = 142;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (swingdowntype == -3)
        {
        }
        else if (x == (camerax() + 344))
        {
            inst = instance_create((obj_growtangle.x - 75) + 5, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 88;
            inst.image_yscale = 142;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (x == (camerax() + 268 + 62))
        {
            inst = instance_create((obj_growtangle.x - 75) + 5, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 70;
            inst.image_yscale = 142;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (x == (camerax() + 302))
        {
            inst = instance_create(obj_growtangle.x - 18, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 90;
            inst.image_yscale = 142;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else if (x == ((camerax() + 378) - 62))
        {
            inst = instance_create(obj_growtangle.x, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 72;
            inst.image_yscale = 142;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        else
        {
            var xlocation;
            if (obj_growtangle.maxxscale == 2)
            {
                if (image_xscale < 0)
                    xlocation = x - 90;
                else
                    xlocation = x + 18;
            }
            else
            {
                if (image_xscale < 0)
                    xlocation = x + 52;
                else
                    xlocation = x + 18;
                if (xlocation < (obj_growtangle.x - 70))
                    xlocation = obj_growtangle.x - 70;
                if (xlocation > obj_growtangle.x)
                    xlocation = obj_growtangle.x;
            }
            inst = instance_create(xlocation, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 72;
            inst.image_yscale = 142;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        if (special != 0)
            inst.special = special;
    }
    if (alphacon == 0)
    {
        alpha += 0.2;
        if (alpha == 1.2)
            alphacon = 1;
    }
    else
    {
        alpha -= 0.2;
    }
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, alpha);
    d3d_set_fog(false, c_black, 0, 0);
    eye_index += 0.4;
    if (swingdowntype == 1)
        eye_index += 0.6;
    if (eye_index >= 5)
        eye_con = 0;
}
