extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_tree().get_root().get_node("main/Player");
var para = 1.0;
var max_e = 0.3;
var min_e = 0.2;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	
	if player.dead == true:
		max_e = 1
		min_e = 0.5
	else:
		max_e = 0.3
		min_e = 0.1
	$PlayArea.get_surface_material(0).emission_energy += 0.001*para;
	
	if $PlayArea.get_surface_material(0).emission_energy >= max_e && para == 1:
		para = para*-1
		
	if $PlayArea.get_surface_material(0).emission_energy <= min_e && para == -1:
		para = para*-1
		
	pass
