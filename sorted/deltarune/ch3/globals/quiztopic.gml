function scr_quiztopic(arg0)
{
    var __tempMarker = instance_create(x, y, obj_marker);
    with (__tempMarker)
        scr_quiztext(arg0);
    var myTopic = __tempMarker.topic;
    with (__tempMarker)
        instance_destroy();
    return myTopic;
}
