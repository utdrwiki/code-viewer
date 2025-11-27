with (obj_dbullet_maker)
    instance_destroy();
take_photo = false;
var _index = 0;
var _newbullet = 0;
var _snap_w = obj_growtangle.sprite_width + 50;
var _snap_h = obj_growtangle.sprite_height + 50;
if (!surface_exists(snapshot))
    snapshot = surface_create(shotsize, shotsize);
snd_play_volume(snd_camera_flash, 0.8);
scr_debug_print("Click!");
var _px = choose(-25, 25);
var _py = choose(-25, 25);
if (difficulty > 2)
{
    _px = 0;
    _py = 0;
}
else if (difficulty > 0)
{
    _px = 0;
    _py = 0;
}
else if (sign(_px) == sign(obj_heart.x - obj_growtangle.x) && sign(_py) == sign(obj_heart.y - obj_growtangle.y))
{
    if (point_distance(obj_heart.x, obj_heart.y, obj_growtangle.x, obj_growtangle.y) > 25)
    {
        _px = 0;
        _py = 0;
    }
    else
    {
        var _flip = irandom(2);
        if (_flip == 0 || _flip == 1)
            _px *= -1;
        if (_flip == 1 || _flip == 2)
            _py *= -1;
    }
}
pivotx += _px;
pivoty += _py;
if (difficulty < 2)
{
    framex = obj_growtangle.x;
    framey = obj_growtangle.y;
}
else
{
    framex = pivotx;
    framey = pivoty;
}
debug_print("difficulty = " + string(difficulty));
surface_set_target(snapshot);
draw_clear(c_white);
gpu_set_blendmode_ext_sepalpha(bm_zero, bm_inv_src_color, bm_src_alpha, bm_inv_src_alpha);
draw_surface_part(application_surface, screenx(framex - (shotsize / 2)), screeny(framey - (shotsize / 2)), shotsize, shotsize, 0, 0);
surface_reset_target();
draw_set_blend_mode(bm_normal);
border = -4;
border = instance_create(framex, framey, obj_bulletparent);
border.sprite_index = spr_battlebg_stretch;
border.image_xscale = obj_growtangle.image_xscale * (shotsize / 150);
border.image_yscale = obj_growtangle.image_yscale * (shotsize / 150);
border.image_blend = c_gray;
border.image_speed = 0;
border.photo = true;
freeze = true;
with (obj_collidebullet)
{
    var _inbounds = point_in_rectangle(x, y, other.framex - (other.shotsize / 2), other.framey - (other.shotsize / 2), other.framex + (other.shotsize / 2), other.framey + (other.shotsize / 2));
    if (other.difficulty >= 2 && !_inbounds)
        continue;
    if (_inbounds)
        image_blend = #8ADCFF;
    var _bullet;
    if (other.difficulty >= 1 && _inbounds)
    {
        _bullet = self;
        scr_copybullet();
        _bullet.photo = true;
        _bullet.image_blend = #8ADCFF;
        paused = true;
    }
    else if (other.difficulty <= 1)
    {
        _bullet = instance_create(x, y, obj_shutta_photobullet);
        with (_bullet)
            scr_bullet_init();
        scr_image_copy(_bullet, self);
        scr_bullet_inherit(_bullet);
        _bullet.active = active;
        instance_destroy();
    }
    _bullet.friction = 0;
    _bullet.destroyonhit = false;
    _bullet.image_speed = 0;
    _bullet.speed = 0;
    if (_inbounds)
    {
        other.bullets[_index] = _bullet;
        _index++;
        if (other.motion_blur && v_ex("afterimage"))
        {
            var _af = 0;
            for (_af = 0; _af < other.afterimage_count; _af++)
            {
                if (i_ex(afterimage[_af]))
                {
                    afterimage[_af].image_alpha = afterimage[_af].saved_alpha;
                    afterimage[_af].image_blend = image_blend;
                    if (other.afterimage_style == 1)
                        afterimage[_af].image_angle = image_angle;
                }
            }
        }
    }
    else
    {
        _bullet.disappear = true;
    }
}
if (difficulty < 2)
{
    with (obj_bulletparent)
    {
        if (!v_ex("photo") && true)
        {
            var _bullet = instance_create(x, y, obj_shutta_photobullet);
            scr_image_copy(_bullet, self);
            instance_destroy();
            if (gt_inbounds_tol(x, y, other.padding + 5))
                _bullet.disappear = true;
            _bullet.active = false;
        }
    }
    with (obj_shutta_photo_attack)
        con = 2;
}
var _total_time = edit_time + wait_time + 30;
with (obj_script_delayed)
{
    if (i_ex(target) && iv_ex(target, "paused") && target.paused)
        alarm[0] = alarm[0] + _total_time;
}
with (obj_lerpvar)
{
    if (i_ex(target) && iv_ex(target, "paused") && target.paused)
        time -= _total_time;
}
draw_set_blend_mode(bm_normal);
if (instance_exists(obj_shadowman_sax_attack))
{
    var _extra_surface = surface_create(640, 480);
    surface_set_target(_extra_surface);
    with (obj_shadowman_sax_attack)
    {
        event_user(6);
        freeze = true;
    }
    surface_reset_target();
    draw_set_alpha(1);
    extra_sprite = sprite_create_from_surface(_extra_surface, screenx(framex - (shotsize / 2)), screeny(framey - (shotsize / 2)), shotsize, shotsize, false, false, 0, 0);
    extra_sprite_obj = scr_marker(framex - (shotsize / 2), framex - (shotsize / 2), extra_sprite);
    extra_sprite_obj.depth = obj_heart.depth + 1;
    surface_free(_extra_surface);
}
listsize = _index;
if (attacktype == 146)
{
    with (obj_dbulletcontroller)
    {
        btimer = -20;
        timermax *= 2.5;
    }
}
