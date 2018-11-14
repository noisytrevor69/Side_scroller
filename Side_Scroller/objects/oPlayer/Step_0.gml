/// @description Insert description here
// You can write your code in this editor

key_left = keyboard_check(vk_left) || keyboard_check("A");
key_right = keyboard_check(vk_right) || keyboard_check("D");
key_jump = keyboard_check_pressed(vk_space);

//calc movement

var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;


//jumping

if (place_meeting(x,y + 1, oWall)) and (key_jump)
{
	vsp = -7;
	
}


//vertical collision

if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y + sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;


//horizontal collision

if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x +sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//animation

if(!place_meeting(x,y+1,oWall))
{
	sprite_index = sPlayerJ
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 10;
	if (hsp == 0)
	{
		sprite_index = sPlayer;
	}
	else
	{
		sprite_index = sPlayerM;
	}
}
if (hsp != 0) image_xscale = sign(hsp);



