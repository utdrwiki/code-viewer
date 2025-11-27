layer_set_visible("TILES_BG", 1);
layer_set_visible("TILES_WALL", 0);
with (obj_sprhighlight)
    instance_destroy();
ripplemanager.lightcon = 1;
darkness = instance_create(x, y, obj_darkness_overlay);
krlight = instance_create(kris.x, kris.y, obj_light_following);
krlight.preset = 1;
sulight = instance_create(kris.x, kris.y, obj_light_following);
sulight.preset = 2;
ralight = instance_create(kris.x, kris.y, obj_light_following);
ralight.preset = 3;
safe_delete(wafer.marker);
safe_delete(wafer);
for (var i = 0; i < array_length(organik); i++)
{
    with (organik[i])
        image_blend = c_white;
}
with (obj_light_following)
{
    size = 10;
    scr_lerpvar("size", 10, 80, 10, -1, "out");
}
with (obj_dw_church_glowtile)
{
    pushonce = true;
    scr_delay_var("pressed", 1, 10);
    scr_delay_var("glow", false, 10);
}
var ph = scr_heromarker("", "pianohint");
with (instance_create(ph[0], ph[1], obj_church_piano_hint))
{
    silent = other.roomstart;
    dotrig = true;
}
with (obj_genmarker)
{
    if (extflag == "shortcutkiller")
    {
        var _list = ds_list_create();
        var _num = instance_place_list(x, y, 376, _list, false);
        for (var i = 0; i < _num; i++)
        {
            with (ds_list_find_value(_list, i))
                setxy(room_width, y);
        }
        ds_list_destroy(_list);
        _list = ds_list_create();
        _num = instance_place_list(x, y, 1031, _list, false);
        for (var i = 0; i < _num; i++)
        {
            with (ds_list_find_value(_list, i))
                setxy(room_width, y);
        }
        ds_list_destroy(_list);
    }
}
con = 1;
