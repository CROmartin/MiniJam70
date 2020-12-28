extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("..").in_menu = 1;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_mouse_entered():
	get_node("..").play = 1;
	pass # Replace with function body.


func _on_Play_mouse_exited():
	get_node("..").play = 0;
	pass # Replace with function body.


func _on_Quit_mouse_entered():
	get_node("..").quit = 1;
	pass # Replace with function body.


func _on_Quit_mouse_exited():
	get_node("..").quit = 0;
	pass # Replace with function body.
