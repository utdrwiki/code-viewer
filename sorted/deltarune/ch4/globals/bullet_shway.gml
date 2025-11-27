function scr_bullet_shway()
{
    if (image_index == 0)
    {
        shway_counter++;
        x += (sin(shway_counter * 0.1) * 3);
        with (scr_afterimagefast())
        {
            fadeSpeed *= 3;
            image_blend = c_gray;
        }
    }
}
