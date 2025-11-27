depth = -10;
ball1 = instance_create_depth(x - 10, y - 15, depth + 1, obj_train_snowball);
ball2 = instance_create_depth(x, y - 15, depth + 1, obj_train_snowball);
ball3 = instance_create_depth(x - 5, y - 22, depth + 1, obj_train_snowball);
hit = false;
debug_message(depth);
