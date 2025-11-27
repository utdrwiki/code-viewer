scr_populatechars();
if (!init)
{
    var slidemark = scr_genmarker("slidemarker");
    if (makeslide)
    {
        layer_set_visible("BG_SLIDE", true);
        with (instance_create(slidemark.x, slidemark.y, obj_darkslide_new))
            scr_sizeexact(slidemark.sprite_width, slidemark.sprite_height);
    }
    else
    {
        layer_set_visible("BG_SLIDE", false);
        with (instance_create(slidemark.x, slidemark.y, obj_solidblock))
            scr_sizeexact(slidemark.sprite_width, slidemark.sprite_height);
    }
    init = 1;
}
