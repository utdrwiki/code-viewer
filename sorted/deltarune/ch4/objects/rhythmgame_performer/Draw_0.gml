if (silhouette)
{
}
if (loop)
    image_index = (((rhythmer.trackpos * animspeed) / rhythmer.notespacing) % 1) * image_number;
if (shakeamt > 0)
{
    draw_self_offset(shakeamt * on, 0);
    shakeamt -= shakereduct;
    on *= -1;
}
else if (!silhouette)
{
    draw_self();
}
if (silhouette)
{
    var _xx = 0;
    var _yy = 4;
    if (name == "susie")
        _xx = -2;
    if (name == "kris")
        _yy = 4;
    if (name == "ralsei")
        _xx = 2;
    draw_set_alpha(1);
    scr_draw_set_mask(false, true);
    ossafe_fill_rectangle(obj_rhythmgame.x, obj_rhythmgame.y + 396, obj_rhythmgame.x + 640, cameray() + 480, false);
    scr_draw_in_mask_begin();
    draw_self();
    scr_draw_in_mask_end();
    scr_draw_self_silhouette_plus_mask_start(_xx, _yy);
    draw_set_alpha(0);
    ossafe_fill_rectangle(obj_rhythmgame.x, obj_rhythmgame.y + 396, obj_rhythmgame.x + 640, cameray() + 480, false);
    scr_draw_self_silhouette_plus_mask_end(_xx, _yy);
}
