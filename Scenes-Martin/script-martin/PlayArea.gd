extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var para = 1.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	
	$PlayArea.get_surface_material(0).emission_energy += 0.001*para
	if $PlayArea.get_surface_material(0).emission_energy >= 0.3 && para == 1:
		para = para*-1
		
	if $PlayArea.get_surface_material(0).emission_energy <= 0.2 && para == -1:
		para = para*-1
		
	pass
