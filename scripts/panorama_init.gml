//panorama_init(north,east,south,west,up,down);

if (sprite_exists(argument0)) {tex_n = sprite_get_texture(argument0,0);} else {tex_n = sprite_get_texture(sprNoTexture,0);}
if (sprite_exists(argument1)) {tex_e = sprite_get_texture(argument1,0);} else {tex_e = sprite_get_texture(sprNoTexture,0);}
if (sprite_exists(argument2)) {tex_s = sprite_get_texture(argument2,0);} else {tex_s = sprite_get_texture(sprNoTexture,0);}
if (sprite_exists(argument3)) {tex_w = sprite_get_texture(argument3,0);} else {tex_w = sprite_get_texture(sprNoTexture,0);}
if (sprite_exists(argument4)) {tex_u = sprite_get_texture(argument4,0);} else {tex_u = sprite_get_texture(sprNoTexture,0);}
if (sprite_exists(argument5)) {tex_d = sprite_get_texture(argument5,0);} else {tex_d = sprite_get_texture(sprNoTexture,0);}

skybox_n = d3d_model_create();
    d3d_model_primitive_begin(skybox_n,pr_trianglestrip);
    d3d_model_vertex_texture(skybox_n,-5, -5,  5,0,0);
    d3d_model_vertex_texture(skybox_n, 5, -5,  5,1,0);
    d3d_model_vertex_texture(skybox_n,-5, -5, -5,0,1);
    d3d_model_vertex_texture(skybox_n, 5, -5, -5,1,1);
    d3d_model_primitive_end(skybox_n);

skybox_e = d3d_model_create();
    d3d_model_primitive_begin(skybox_e,pr_trianglestrip);
    d3d_model_vertex_texture(skybox_e, 5, -5,  5,0,0);
    d3d_model_vertex_texture(skybox_e, 5,  5,  5,1,0);
    d3d_model_vertex_texture(skybox_e, 5, -5, -5,0,1);
    d3d_model_vertex_texture(skybox_e, 5,  5, -5,1,1);
    d3d_model_primitive_end(skybox_e);

skybox_s = d3d_model_create();
    d3d_model_primitive_begin(skybox_s,pr_trianglestrip);
    d3d_model_vertex_texture(skybox_s, 5, 5,  5,0,0);
    d3d_model_vertex_texture(skybox_s,-5, 5,  5,1,0);
    d3d_model_vertex_texture(skybox_s, 5, 5, -5,0,1);
    d3d_model_vertex_texture(skybox_s,-5, 5, -5,1,1);
    d3d_model_primitive_end(skybox_s);

skybox_w = d3d_model_create();
    d3d_model_primitive_begin(skybox_w,pr_trianglestrip);
    d3d_model_vertex_texture(skybox_w,-5,  5,  5,0,0);
    d3d_model_vertex_texture(skybox_w,-5, -5,  5,1,0);
    d3d_model_vertex_texture(skybox_w,-5,  5, -5,0,1);
    d3d_model_vertex_texture(skybox_w,-5, -5, -5,1,1);
    d3d_model_primitive_end(skybox_w);

skybox_u = d3d_model_create();
    d3d_model_primitive_begin(skybox_u,pr_trianglestrip);
    d3d_model_vertex_texture(skybox_u,-5,  5,  5,0,0);
    d3d_model_vertex_texture(skybox_u, 5,  5,  5,1,0);
    d3d_model_vertex_texture(skybox_u,-5, -5,  5,0,1);
    d3d_model_vertex_texture(skybox_u, 5, -5,  5,1,1);
    d3d_model_primitive_end(skybox_u);
    
skybox_d = d3d_model_create();
    d3d_model_primitive_begin(skybox_d,pr_trianglestrip);
    d3d_model_vertex_texture(skybox_d, 5, -5, -5,1,0);
    d3d_model_vertex_texture(skybox_d, 5,  5, -5,1,1);
    d3d_model_vertex_texture(skybox_d,-5, -5, -5,0,0);
    d3d_model_vertex_texture(skybox_d,-5,  5, -5,0,1);
    d3d_model_primitive_end(skybox_d);
