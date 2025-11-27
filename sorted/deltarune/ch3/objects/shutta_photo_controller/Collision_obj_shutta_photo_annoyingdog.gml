if (state == "capture")
{
    array_push(subjects, other.id);
    if (point_distance(x, y, other.x + 40, other.y + 40) < centered_distance)
        endmessage = stringsetloc("* Great dog picture!&* Well centered!", "obj_shutta_photo_controller_slash_Collision_obj_shutta_photo_annoyingdog_gml_7_0");
    else
        endmessage = stringsetloc("* Dog picture was not centered well!", "obj_shutta_photo_controller_slash_Collision_obj_shutta_photo_annoyingdog_gml_11_0");
    instance_destroy(other);
}
