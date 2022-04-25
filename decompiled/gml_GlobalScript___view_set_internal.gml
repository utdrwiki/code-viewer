__view_set_internal = function(argument0, argument1, argument2) //gml_Script___view_set_internal
{
    var __prop = argument0
    var __index = argument1
    var __val = argument2
    switch __prop
    {
        case (0 << 0):
            var __cam = view_get_camera(__index)
            camera_set_view_pos(__cam, __val, camera_get_view_y(__cam))
            break
        case (1 << 0):
            __cam = view_get_camera(__index)
            camera_set_view_pos(__cam, camera_get_view_x(__cam), __val)
            break
        case (2 << 0):
            __cam = view_get_camera(__index)
            camera_set_view_size(__cam, __val, camera_get_view_height(__cam))
            break
        case (3 << 0):
            __cam = view_get_camera(__index)
            camera_set_view_size(__cam, camera_get_view_width(__cam), __val)
            break
        case (4 << 0):
            __cam = view_get_camera(__index)
            camera_set_view_angle(__cam, __val)
            break
        case (5 << 0):
            __cam = view_get_camera(__index)
            camera_set_view_border(__cam, __val, camera_get_view_border_y(__cam))
            break
        case (6 << 0):
            __cam = view_get_camera(__index)
            camera_set_view_border(__cam, camera_get_view_border_x(__cam), __val)
            break
        case (7 << 0):
            __cam = view_get_camera(__index)
            camera_set_view_speed(__cam, __val, camera_get_view_speed_y(__cam))
            break
        case (8 << 0):
            __cam = view_get_camera(__index)
            camera_set_view_speed(__cam, camera_get_view_speed_x(__cam), __val)
            break
        case (9 << 0):
            __cam = view_get_camera(__index)
            camera_set_view_target(__cam, __val)
            break
        case (10 << 0):
            __res = view_set_visible(__index, __val)
            break
        case (11 << 0):
            __res = view_set_xport(__index, __val)
            break
        case (12 << 0):
            __res = view_set_yport(__index, __val)
            break
        case (13 << 0):
            __res = view_set_wport(__index, __val)
            break
        case (14 << 0):
            __res = view_set_hport(__index, __val)
            break
        case (15 << 0):
            __res = view_set_camera(__index, __val)
            break
        case (16 << 0):
            __res = view_set_surface_id(__index, __val)
            break
        default:
            break
    }

    return 0;
}

