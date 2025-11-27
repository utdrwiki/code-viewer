if (!variable_instance_exists(id, "collider") || !instance_exists(collider))
    exit;
var _scale = radius + 20;
collider.x = x;
collider.y = y;
collider.image_xscale = _scale / 10;
collider.image_yscale = _scale / 10;
