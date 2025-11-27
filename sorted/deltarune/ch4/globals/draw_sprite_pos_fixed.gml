vertex_format_begin();
vertex_format_add_colour();
vertex_format_add_position();
vertex_format_add_normal();
global.format_perspective = vertex_format_end();

function draw_sprite_pos_fixed(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
{
    draw_sprite_pos_fixed_col(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, 16777215, arg10);
}

function draw_sprite_pos_fixed_col(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11)
{
    var texture = sprite_get_texture(arg0, arg1);
    var uvs = sprite_get_uvs(arg0, arg1);
    var ax = arg4 - arg8;
    var ay = arg5 - arg9;
    var bx = arg2 - arg6;
    var by = arg3 - arg7;
    var can = (ax * by) - (ay * bx);
    if (can != 0)
    {
        var cx = arg8 - arg6;
        var cy = arg9 - arg7;
        var s = ((ax * cy) - (ay * cx)) / can;
        if (s > 0 && s < 1)
        {
            var t = ((bx * cy) - (by * cx)) / can;
            if (t > 0 && t < 1)
            {
                var q4 = 1 / (1 - t);
                var q3 = 1 / (1 - s);
                var q2 = 1 / t;
                var q1 = 1 / s;
                var v_buffer = vertex_create_buffer();
                vertex_begin(v_buffer, global.format_perspective);
                vertex_colour(v_buffer, arg10, arg11);
                vertex_position(v_buffer, arg2, arg3);
                vertex_normal(v_buffer, q1 * uvs[0], q1 * uvs[1], q1);
                vertex_colour(v_buffer, arg10, arg11);
                vertex_position(v_buffer, arg4, arg5);
                vertex_normal(v_buffer, q2 * uvs[2], q2 * uvs[1], q2);
                vertex_colour(v_buffer, arg10, arg11);
                vertex_position(v_buffer, arg8, arg9);
                vertex_normal(v_buffer, q4 * uvs[0], q4 * uvs[3], q4);
                vertex_colour(v_buffer, arg10, arg11);
                vertex_position(v_buffer, arg6, arg7);
                vertex_normal(v_buffer, q3 * uvs[2], q3 * uvs[3], q3);
                vertex_end(v_buffer);
                shader_set(sh_perspective);
                vertex_submit(v_buffer, pr_trianglestrip, texture);
                shader_reset();
                vertex_delete_buffer(v_buffer);
            }
        }
    }
}

function draw_surface_pos_fixed(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
{
    var texture = surface_get_texture(arg0);
    var ax = arg4 - arg8;
    var ay = arg5 - arg9;
    var bx = arg2 - arg6;
    var by = arg3 - arg7;
    var can = (ax * by) - (ay * bx);
    if (can != 0)
    {
        var cx = arg8 - arg6;
        var cy = arg9 - arg7;
        var s = ((ax * cy) - (ay * cx)) / can;
        if (s > 0 && s < 1)
        {
            var t = ((bx * cy) - (by * cx)) / can;
            if (t > 0 && t < 1)
            {
                var q4 = 1 / (1 - t);
                var q3 = 1 / (1 - s);
                var q2 = 1 / t;
                var q1 = 1 / s;
                var v_buffer = vertex_create_buffer();
                vertex_begin(v_buffer, global.format_perspective);
                vertex_colour(v_buffer, c_white, arg10);
                vertex_position(v_buffer, arg2, arg3);
                vertex_normal(v_buffer, q1 * 0, q1 * 0, q1);
                vertex_colour(v_buffer, c_white, arg10);
                vertex_position(v_buffer, arg4, arg5);
                vertex_normal(v_buffer, q2 * 1, q2 * 0, q2);
                vertex_colour(v_buffer, c_white, arg10);
                vertex_position(v_buffer, arg8, arg9);
                vertex_normal(v_buffer, q4 * 0, q4 * 1, q4);
                vertex_colour(v_buffer, c_white, arg10);
                vertex_position(v_buffer, arg6, arg7);
                vertex_normal(v_buffer, q3 * 1, q3 * 1, q3);
                vertex_end(v_buffer);
                shader_set(sh_perspective);
                vertex_submit(v_buffer, pr_trianglestrip, texture);
                shader_reset();
                vertex_delete_buffer(v_buffer);
            }
        }
    }
}
