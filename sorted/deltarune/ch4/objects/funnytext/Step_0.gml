if (init == 0)
{
    var playsound = 1;
    if (settinga == 0)
        typingstyle = 0;
    if (settinga == 1)
        typingstyle = 1;
    y += 5;
    if (typingstyle == 0)
    {
        x += sprite_width;
        y += (sprite_height / 2);
        image_xscale = 0;
        image_yscale = 0;
        lerpa = scr_lerpvar("image_xscale", 0, 2, 10, -2, "out");
        lerpb = scr_lerpvar("image_yscale", 0, 2, 10, -2, "out");
    }
    init = 1;
    if (playsound)
        snd_play(typingnoise);
}
if (i_ex(obj_writer))
{
    if (obj_writer.halt > 0)
        writerfinished = 1;
}
if (typingstyle == 0)
{
    if (writerfinished)
    {
        image_xscale = 2;
        image_yscale = 2;
        with (lerpa)
            instance_destroy();
        with (lerpb)
            instance_destroy();
    }
}
if (typingstyle == 1)
{
    chartimer++;
    if (writerfinished)
    {
        charmax = image_number;
        typingfinished = 1;
    }
    if (!typingfinished)
    {
        if (chartimer >= typingspeed)
        {
            chartimer = 0;
            charmax++;
            if (charmax >= image_number)
                typingfinished = 1;
            snd_play(typingnoise);
        }
    }
}
if (!i_ex(obj_writer))
    instance_destroy();
