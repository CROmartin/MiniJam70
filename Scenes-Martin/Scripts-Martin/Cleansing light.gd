extends Spatial

onready var player = get_tree().get_root().get_node("Player");

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	player = get_tree().get_root().get_node("main/Player");
	var distance = translation.distance_to(player.translation);
	if distance < 5:
		$OmniLight.light_energy -= 0.01;
	
	pass
