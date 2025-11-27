image_xscale = 2;
image_yscale = 2;
image_speed = 0;
move_timer = 0;
movecon = 0;
var _directions = [new Vector2(0, 1), new Vector2(1, 0), new Vector2(0, -1), new Vector2(-1, 0)];
target_direction = _directions[irandom(array_length(_directions) - 1)];
speed_modifier = 1;
