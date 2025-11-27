if (i_ex(obj_ch4_DCA04))
    depth = 7000;
siner++;
if ((siner % 8) == 0)
{
    with (scr_afterimage())
    {
        depth = other.depth + 1;
        scr_size(1, 1);
    }
}
var mytarg = ytarg;
if (i_ex(obj_dw_church_northprophecies))
    mytarg = 1530;
if (i_ex(obj_dw_church_lantern_hallway))
    mytarg = 1208;
if (fadeoutmode == 0)
{
    if (scr_trigcheck_ext("groundsparklekiller", id))
        fadeoutmode = 1;
}
if (fadeoutmode == 0)
{
    if (y >= mytarg && choose(0, 1) == 0)
    {
        scr_marker_ext(scr_even(x), scr_even(y), sprite_index, 2, 2, undefined, random(30), undefined, undefined, 1);
        instance_destroy();
    }
}
if (fadeoutmode == 1)
{
    image_alpha -= 0.05;
    if (image_alpha <= 0)
        instance_destroy();
}
