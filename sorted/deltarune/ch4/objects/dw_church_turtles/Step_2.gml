if (global.plot == 141)
{
    if (global.interact == 0)
    {
        if (i_ex(gerson))
        {
            var targx = max(kris.bbox_right, susie.bbox_right, ralsei.bbox_right) + 20;
            if (gerson.bbox_left > targx)
            {
                with (gerson)
                    x = scr_even(clamp(x, targx, x - 4));
                gerson.image_index += 0.16666666666666666;
            }
            else
            {
                gerson.image_index = 0;
            }
            with (gerson)
                scr_depth();
        }
    }
}
