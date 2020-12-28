extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_song = "";
var p = 0;

func _ready():
#	get_node("sc_ambiance").play();
	pass 

func _process(delta):
	if current_song != "":
		if !get_node(current_song).is_playing():
			change_song("sc_pc_idle");
	pass

func change_song(song):
	if !get_node(song).is_playing():
		if current_song != "":
			get_node(current_song).stop();
		get_node(song).play();
		current_song = song;
		

func play_sound(sound):
	if !get_node(sound).is_playing():
		if sound != "sfx_pc-move_start":
			get_node(sound).play();
			
		if sound == "sfx_pc-move_start" && !get_node("sfx_pc-move_start").is_playing() && !get_node("sfx_pc-move").is_playing():
			get_node(sound).play();
			p = 1;

	

	
