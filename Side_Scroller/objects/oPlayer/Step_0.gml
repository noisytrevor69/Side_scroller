/// @description Insert description here
// You can write your code in this editor

key_left = keyboard_check(vk_left) || keyboard_check("A");
key_right = keyboard_check(vk_right) || keyboard_check("D");
key_jump = keyboard_check_pressed(vk_space);

//calc movement

var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;
x = x +hsp;
y = y +vsp;

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



//horizontal collision

if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x +sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}