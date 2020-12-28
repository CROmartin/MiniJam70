extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var para2 = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var max_e = 2;
	var min_e = 0.0;
	$Tree_A.get_surface_material(0).emission_energy += 0.005*para2;
	
	if $Tree_A.get_surface_material(0).emission_energy >= max_e && para2 == 1:
		para2 = para2*-1
				
	if $Tree_A.get_surface_material(0).emission_energy <= min_e && para2 == -1:
		para2 = para2*-1
	pass
