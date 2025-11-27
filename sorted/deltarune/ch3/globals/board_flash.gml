function scr_board_flash()
{
    var starttime = 15;
    var fadetime = 6;
    ____flash = scr_marker(0, 0, spr_whitepx);
    ____flash.image_xscale = 640;
    ____flash.image_yscale = 480;
    ____flash.depth = 99996;
    with (____flash)
    {
        scr_delay_var("image_alpha", 0.8, starttime + (fadetime * 0));
        scr_delay_var("image_alpha", 0.6, starttime + (fadetime * 1));
        scr_delay_var("image_alpha", 0.4, starttime + (fadetime * 2));
        scr_delay_var("image_alpha", 0.2, starttime + (fadetime * 3));
        scr_doom(id, starttime + (fadetime * 4));
    }
}
