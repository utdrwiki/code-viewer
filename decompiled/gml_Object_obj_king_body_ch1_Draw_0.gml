draw_self()
draw_set_color(c_green)
draw_text(0, 0, string_hash_to_newline(attackno))
if instance_exists(obj_chainking_ch1)
{
    draw_set_color(c_yellow)
    draw_text(0, 40, string_hash_to_newline(obj_chainking_ch1.x))
    draw_text(0, 60, string_hash_to_newline(obj_chainking_ch1.y))
}
