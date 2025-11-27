draw_self();
if (eye_con == 1)
{
    if (eye_index == 0)
    {
        afterimage = scr_afterimage();
        afterimage.vspeed = 2.5;
        afterimage.image_alpha = 0.6;
        afterimage = scr_afterimage();
        afterimage.vspeed = -2.5;
        afterimage.image_alpha = 0.6;
        afterimage = scr_afterimage();
        afterimage.hspeed = 2.5;
        afterimage.image_alpha = 0.6;
        afterimage = scr_afterimage();
        afterimage.hspeed = -2.5;
        afterimage.image_alpha = 0.6;
        snd_play_pitch(snd_eye_telegraph, 1);
        if (swingdowntype == 10)
        {
            var ylocation = y + 26;
            if (ylocation < (obj_growtangle.y - 70))
                ylocation = obj_growtangle.y - 70;
            if (ylocation > obj_growtangle.y)
                ylocation = obj_growtangle.y;
            inst = instance_create((obj_growtangle.x - 75) + 5, ylocation, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 142;
            inst.image_yscale = 72;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
            snd_play_pitch(snd_eye_telegraph, 0.95);
        }
        else if (swingdowntype == 11)
        {
            var ylocation = obj_growtangle.y;
            inst = instance_create((obj_growtangle.x - 75) + 5, ylocation, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 142;
            inst.image_yscale = 72;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
            snd_play_pitch(snd_eye_telegraph, 0.95);
        }
        else if (swingdowntype == 12)
        {
            var ylocation = obj_growtangle.y - 70;
            inst = instance_create((obj_growtangle.x - 75) + 5, ylocation, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 142;
            inst.image_yscale = 72;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
            snd_play_pitch(snd_eye_telegraph, 0.95);
        }
        else if (x == (camerax() + 268 + 62))
        {
            inst = instance_create((obj_growtangle.x - 75) + 5, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
            inst.image_xscale = 70;
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
            var xlocation = (x + 52) - 36;
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
