if (parentid != -1 && !instance_exists(parentid))
{
    instance_destroy();
    exit;
}
active_hitbox = parentid.active_hitbox;
x = parentid.x + 16;
y = parentid.y + 16;
depth = parentid.depth - 1;
