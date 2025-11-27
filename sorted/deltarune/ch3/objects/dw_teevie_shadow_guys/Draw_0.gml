siner++;
var anim = siner / 8;
var alph = abs(sin(siner / 30)) + 0.25;
with (shine)
{
    if (other.shadhere)
    {
        image_alpha = alph;
        image_index = anim;
    }
    else
    {
        visible = false;
    }
}
