block = instance_create(x, y, obj_board_solid);
block.image_xscale = 1;
block.image_yscale = 1;
mp_grid_add_cell(global.grid, x / 32, y / 32);
depth = obj_mainchara_board.depth + 1900;
if (room == room_board_dungeon_3)
    sprite_index = spr_board_miniboss_wall_board3;
