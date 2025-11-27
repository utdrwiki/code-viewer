if (global.chapter >= 4)
{
    if (scr_flag_get(747) > 0)
    {
        var kris_star = scr_marker(247, 42, spr_krisroom_star_dark);
        with (kris_star)
            scr_depth();
        var asriel_star_cover = scr_marker(122, 45, spr_pixel_white);
        with (asriel_star_cover)
        {
            depth = 98000;
            image_blend = #598291;
            image_xscale = 3;
            image_yscale = 2;
        }
    }
    if (scr_flag_get(748) > 0)
    {
        var stain_cover = scr_marker(264, 160, spr_pixel_white);
        with (stain_cover)
        {
            depth = 10000;
            image_blend = #004D64;
            image_xscale = 4;
            image_yscale = 5;
        }
    }
}
