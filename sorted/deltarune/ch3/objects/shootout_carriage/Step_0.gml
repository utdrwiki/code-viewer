x = obj_shootout_controller.train_x + x_offset;
y = obj_shootout_controller.train_y + ((cos(x_offset + ((current_time * obj_shootout_controller.wave) / 200)) * 0.5) + 0.5);
