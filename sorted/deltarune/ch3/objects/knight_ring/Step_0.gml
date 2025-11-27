timer++;
image_alpha += (1/3);
image_xscale -= 0.2;
image_yscale -= 0.2;
if (image_xscale == 0.6)
{
}
if (image_xscale == 0)
    instance_destroy();
