if (is_active)
    exit;
if (!i_ex(obj_mainchara))
    exit;
var _on_screen = rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, camerax(), cameray(), camerax() + view_wport[0], cameray() + view_hport[0]);
if (!_on_screen)
    exit;
if (obj_mainchara.x > (x - 10) && obj_mainchara.x < (x + 50) && obj_mainchara.y >= (y + 20))
    turn_on();
