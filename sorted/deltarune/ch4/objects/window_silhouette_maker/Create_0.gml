if (silhouette_obj == 0)
    silhouette_obj = 505;
if (stretch == 0)
    stretch = 1;
with (obj_mainchara)
{
    var _shadow = instance_create(x, y, other.silhouette_obj);
    _shadow.source = self;
    _shadow = instance_create(x, y, obj_cast_shadow);
    _shadow.source = self;
    _shadow.stretch = other.stretch;
}
with (obj_caterpillarchara)
{
    var _shadow = instance_create(x, y, other.silhouette_obj);
    _shadow.source = self;
    _shadow = instance_create(x, y, obj_cast_shadow);
    _shadow.source = self;
    _shadow.stretch = other.stretch;
}
with (obj_npc_room)
{
    var _shadow = instance_create(x, y, other.silhouette_obj);
    _shadow.source = self;
    _shadow = instance_create(x, y, obj_cast_shadow);
    _shadow.source = self;
    _shadow.stretch = other.stretch;
}
with (obj_npc_room_animated)
{
    var _shadow = instance_create(x, y, other.silhouette_obj);
    _shadow.source = self;
    _shadow = instance_create(x, y, obj_cast_shadow);
    _shadow.source = self;
    _shadow.stretch = other.stretch;
}
