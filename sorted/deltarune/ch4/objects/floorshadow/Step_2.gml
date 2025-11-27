if (!i_ex(target) || !target.visible)
    exit;
depth = target.depth + 1;
if (target.object_index == obj_actor)
    depth += 5;
