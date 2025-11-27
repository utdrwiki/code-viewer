if (stretch == 0)
    stretch = 1;
with (obj_mainchara)
{
    var _shadow = instance_create(x, y, obj_character_church_window_silhouette);
    _shadow.source = self;
}
with (obj_caterpillarchara)
{
    var _shadow = instance_create(x, y, obj_character_church_window_silhouette);
    _shadow.source = self;
}
with (obj_npc_room)
{
    var _shadow = instance_create(x, y, obj_character_church_window_silhouette);
    _shadow.source = self;
}
with (obj_npc_room_animated)
{
    var _shadow = instance_create(x, y, obj_character_church_window_silhouette);
    _shadow.source = self;
}
with (obj_dw_church_turtles)
{
    if (i_ex(gerson))
    {
        var _shadow = instance_create(x, y, obj_character_church_window_silhouette);
        _shadow.source = gerson;
    }
}
