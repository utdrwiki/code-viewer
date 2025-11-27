with (base)
    instance_destroy();
for (var i = 0; i < array_length(block); i++)
    safe_delete(block[i]);
for (var i = 0; i < array_length(edge); i++)
    safe_delete(edge[i]);
