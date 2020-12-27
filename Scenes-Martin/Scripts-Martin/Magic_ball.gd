extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var p = get_node("..");
	look_at(p.linear_velocity, Vector3(0,1,0));
	pass
