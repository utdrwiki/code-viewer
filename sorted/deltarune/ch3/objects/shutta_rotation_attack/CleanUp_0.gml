if (surface_exists(snapshot))
    surface_free(snapshot);
if (instance_exists(extra_sprite_obj))
    instance_destroy(extra_sprite_obj);
if (sprite_exists(extra_sprite))
    sprite_delete(extra_sprite);
with (obj_writer)
    instance_destroy();
