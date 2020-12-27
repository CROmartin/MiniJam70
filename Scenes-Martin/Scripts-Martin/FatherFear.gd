extends Spatial

onready var player = get_tree().get_root().get_node("main/Player");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	
	look_at_from_position(translation, player.translation, Vector3(0,1,0));
	pass
