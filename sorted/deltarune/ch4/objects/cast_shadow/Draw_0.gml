if (init == 0)
{
    init = 1;
    if (yoffset < 0)
        yoffset = sprite_get_height(source.sprite_index) - 1;
}
image_blend = c_black;
sprite_index = source.sprite_index;
image_index = source.image_index;
image_xscale = source.image_xscale;
image_yscale = -source.image_yscale * stretch;
x = source.x;
y = source.y + (yoffset * -image_yscale * (1 + stretch));
draw_self();
