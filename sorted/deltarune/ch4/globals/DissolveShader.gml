function DissolveShader(arg0, arg1, arg2, arg3, arg4)
{
    var _DissolveSprUvs = sprite_get_uvs(arg0, arg1);
    shader_set(_Dissolve_Shader);
    shader_set_uniform_f(_u_Dissolve, arg4);
    shader_set_uniform_f(_u_DissolveEdge, _DissolveEdge);
    shader_set_uniform_f(_u_DissolveUV, _DissolveTexUvs[0], _DissolveTexUvs[1]);
    shader_set_uniform_f(_u_DefaultUV, _DissolveSprUvs[0], _DissolveSprUvs[1]);
    shader_set_uniform_f(_u_DissolveC1, _DissolveC1[0], _DissolveC1[1], _DissolveC1[2]);
    shader_set_uniform_f(_u_DissolveC2, _DissolveC2[0], _DissolveC2[1], _DissolveC2[2]);
    texture_set_stage(_u_DissolveTex, _DissolveTex);
    draw_sprite_ext(arg0, arg1, arg2, arg3, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    shader_reset();
}
