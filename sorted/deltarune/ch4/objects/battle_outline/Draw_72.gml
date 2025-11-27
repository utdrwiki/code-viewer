x = source.x;
y = source.y;
depth = outline ? (source.depth + 1) : source.depth;
if (auto_alpha && instance_exists(obj_battlealphaer))
    image_alpha = obj_battlealphaer.battlealpha;
