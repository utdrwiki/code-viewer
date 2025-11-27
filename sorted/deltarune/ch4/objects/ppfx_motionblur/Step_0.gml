if (instance_exists(obj_camera))
{
    var c = obj_camera;
    motion_blur_angle = point_direction(c.cam_x, c.cam_y, c.cam_x + c.cam_x_delta, c.cam_y + c.cam_y_delta);
    motion_blur_speed = mean(c.cam_x_delta, c.cam_y_delta) * motion_blur_velocity;
    ppfx_effect_set_parameter(ppfx_id, PP_EFFECT.MOTION_BLUR, PP_MOTION_BLUR_ANGLE, motion_blur_angle);
    ppfx_effect_set_parameter(ppfx_id, PP_EFFECT.MOTION_BLUR, PP_MOTION_BLUR_RADIUS, motion_blur_speed);
}
