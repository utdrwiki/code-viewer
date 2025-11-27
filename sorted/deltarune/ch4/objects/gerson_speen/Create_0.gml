event_inherited();
timer = 0;
con = 0;
destroyonhit = false;
active = 0;
image_speed = 0.4;
image_xscale = 2;
image_yscale = 2;
image_alpha = 1;
depth = -999999;
if (x < obj_growtangle.x)
{
    image_xscale = -2;
    direction = 0;
    inst = instance_create((obj_growtangle.x - 75) + 5, obj_growtangle.y, obj_gerson_growtangle_telegraph);
    inst.image_xscale = 142;
    inst.image_yscale = 72;
    if (i_ex(obj_heart))
        inst.depth = obj_heart.depth + 1;
    snd_play_pitch(snd_eye_telegraph, 0.95);
}
else
{
    image_xscale = 2;
    direction = 180;
    inst = instance_create((obj_growtangle.x - 75) + 5, (obj_growtangle.y - 75) + 5, obj_gerson_growtangle_telegraph);
    inst.image_xscale = 142;
    inst.image_yscale = 70;
    if (i_ex(obj_heart))
        inst.depth = obj_heart.depth + 1;
    snd_play_pitch(snd_eye_telegraph, 1);
}
