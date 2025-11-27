event_inherited();
sinerx++;
sinery++;
if (amplitudex != 0)
    hspeed = (sin(sinerx * timefactorx) * amplitudex) + basehspeed;
if (amplitudey != 0)
    vspeed = (sin(sinery * timefactory) * amplitudey) + basevspeed;
if (updateangle)
    image_angle = direction;
if (_afterimages)
{
    var after = scr_afterimage();
    after.image_alpha = 0.5;
}
