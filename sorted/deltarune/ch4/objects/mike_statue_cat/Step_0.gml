if (act == 1)
{
    image_alpha -= 0.1;
    if (image_alpha <= 0)
    {
        with (mycollider)
            instance_destroy();
        instance_destroy();
    }
}
