with (obj_genmarker)
{
    if (extflag == "hintmark")
    {
        with (instance_create(x, y, obj_church_piano_hint))
        {
            silent = true;
            preinit = 1;
        }
    }
}
var slidemarker = scr_genmarker("slide");
with (instance_create(slidemarker.x, slidemarker.y, obj_darkslide_new))
    scr_sizeexact(slidemarker.sprite_width, slidemarker.sprite_height);
with (obj_solidblocksized_alt)
{
    if (extflag == "slideUnlock")
        instance_destroy();
}
layer_set_visible("Tiles_ShortcutUnlock", true);
