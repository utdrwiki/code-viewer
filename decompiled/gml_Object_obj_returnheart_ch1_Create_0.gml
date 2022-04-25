burst = 0
shift = 1
image_alpha = 1
flytime = 8
distx = (obj_herokris_ch1.x + 10)
disty = (obj_herokris_ch1.y + 40)
dist = point_distance(x, y, distx, disty)
move_towards_point(distx, disty, (dist / flytime))
alarm[0] = flytime
image_speed = 0
