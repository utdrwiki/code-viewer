if (image_alpha == 1)
{
    if (!bunny)
    {
        phototaken = 1;
        _hit = scr_board_marker(x, y, spr_board_shadowgunner_photo, 0, depth, image_xscale);
        _hit.image_yscale = 2;
        hat = scr_board_marker(x, y, spr_board_enemy_shadowman_hit_hat, 0, depth, image_xscale);
        hat.image_yscale = 2;
        hat.vspeed = -10;
        hat.gravity = 1;
        scr_limitval_upper(hat, "y", hat.y);
        image_alpha = 0;
        scr_doom(_hit, 45);
        scr_doom(hat, 45);
        scr_doom(id, 45);
        scr_delay_var("points", 1, 20);
        if (image_xscale == -2)
            _hit.x += 32;
        if (image_xscale == -2)
            hat.x += 32;
        timer = -99999999;
    }
    else
    {
        scr_doom(id, 45);
        scr_delay_var("points", 1, 20);
        image_alpha = 0;
        _hit = scr_board_marker(x, y, spr_board_shadowbunny_photod, 0, depth, image_xscale);
        _hit.image_yscale = 2;
        timer = -99999999;
    }
}
