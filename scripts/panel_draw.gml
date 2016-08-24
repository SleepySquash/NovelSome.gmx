var x1,x2,y1,y2,sw,ss,dx,dy;

x1=argument0
y1=argument1
x2=argument2
y2=argument3
outclr=argument4;
clr=argument5;
sw=global.__panels
ss=global.__panels/3
dx=x2-x1
dy=y2-y1
balpha=draw_get_alpha();

//draw_set_alpha(draw_get_alpha())
//draw_rectangle_colour(x1,y1,x2-1,y2-1,global.__panelc,global.__panelc,global.__panelc,global.__panelc,0)
if ((draw_get_alpha()/global.dialBackAlpha)>0) {draw_set_alpha(draw_get_alpha()/(draw_get_alpha()/global.dialBackAlpha));}
    else {draw_set_alpha(0);}
if (global.dialIsCback) {draw_rectangle_colour(x1,y1,x2-1,y2-1,clr,clr,clr,clr,0);}
draw_set_alpha(balpha);

if (!global.dialBoxBorderedTexture) {if (!global.dialBoxNoScale || global.__panel!=global.dialBox) {
    draw_sprite_pos(global.__panel,-1,x1,y1,x2,y1,x2,y2,x1,y2,draw_get_alpha());}
else {draw_sprite_ext(global.__panel,-1,view_wview/2-sprite_get_width(global.__panel)/2,y2-(y2-y1)/2-sprite_get_height(global.__panel)/2,1,1,0,c_white,draw_get_alpha());}}
else {draw_sprite_part_ext(global.__panel,0,12,0,ss,ss,x1,y1,dx/ss,1,outclr,draw_get_alpha())
draw_sprite_part_ext(global.__panel,0,12,sw-ss,ss,ss,x1,y2-ss,dx/ss,1,outclr,draw_get_alpha())

draw_sprite_part_ext(global.__panel,0,0,12,ss,ss,x1,y1,1,dy/ss,outclr,draw_get_alpha())
draw_sprite_part_ext(global.__panel,0,sw-ss,12,ss,ss,x2-ss,y1,1,dy/ss,outclr,draw_get_alpha())

draw_sprite_part_ext(global.__panel,0,0,0,ss,ss,x1,y1,image_xscale,image_yscale,outclr,draw_get_alpha())
draw_sprite_part_ext(global.__panel,0,0,sw-ss,ss,ss,x1,y2-ss,image_xscale,image_yscale,outclr,draw_get_alpha())

draw_sprite_part_ext(global.__panel,0,sw-ss,0,ss,ss,x2-ss,y1,image_xscale,image_yscale,outclr,draw_get_alpha())
draw_sprite_part_ext(global.__panel,0,sw-ss,sw-ss,ss,ss,x2-ss,y2-ss,image_xscale,image_yscale,outclr,draw_get_alpha());}

//var bx1,by1,bx2,by2;

//bx1=x1+10
//by1=y1+10
//bx2=x2-10
//by2=y2-10
//cx=(x1+x2)/2
//cy=(y1+y2)/2

//draw_rectangle_color(bx1,by1,bx2,by2,c_red,c_red,c_red,c_red,1)
