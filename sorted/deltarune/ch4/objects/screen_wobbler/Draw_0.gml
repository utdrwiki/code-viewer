if (sunkus_kb_check_pressed(78))
{
    helix = !helix;
    if (helix)
        scr_debug_print("helix effect enabled");
    else
        scr_debug_print("helix effect disabled");
}
if (!active && strength <= 0)
    exit;
if (active && strength < 15)
    strength += 0.25;
else if (!active && strength > 0)
    strength = scr_movetowards(strength, 0, 1.5);
if (!surface_exists(screen_surf))
    screen_surf = surface_create(640, 480);
surface_set_target(screen_surf);
draw_clear_alpha(c_black, 1);
siner++;
for (i = 0; i < 480; i += 2)
{
    var _sine = sin((siner + (i / 2)) / 30) * strength;
    if (helix && (i % 4) == 2)
        _sine *= -1;
    surface_copy_part(screen_surf, _sine, i, application_surface, 0, i, 640, 2);
}
surface_reset_target();
draw_surface(screen_surf, camerax(), cameray());
