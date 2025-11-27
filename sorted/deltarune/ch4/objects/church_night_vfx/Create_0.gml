window_surface = -4;
default_surface = -4;
palette_index = 2;
palette_init = false;
lightning_timer = 0;
overlay = -4;

create_overlay = function()
{
    overlay = scr_marker(-10, -10, spr_whitepx_10);
    overlay.image_xscale = (room_width / 10) + 2;
    overlay.image_yscale = (room_height / 10) + 40;
    overlay.image_blend = #00042B;
    overlay.image_alpha = 0.5;
    overlay.depth = 1000;
};

show_lightning = function()
{
    snd_play(snd_thunder_instant);
    scr_lerpvar("palette_index", 1, 2, 90, 3, "out");
    with (overlay)
        scr_lerpvar("image_alpha", 0, 0.5, 90, 3, "out");
    with (obj_marker_palette)
        scr_lerpvar("palette_index", 1, 2, 90, 3, "out");
};

clean_up = function()
{
    if (surface_exists(default_surface))
        surface_free(default_surface);
    if (surface_exists(window_surface))
        surface_free(window_surface);
};

create_overlay();
