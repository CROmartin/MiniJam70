extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var flicker = 0;
var p_l1 = 1.0;
var p_l2 = 1.0;
var p_l3 = 1.0;
var cb_l = 1.0;
var cs_l = 1.0;
var pl1_l = 1.0;
var pl2_l = 1.0;
var pl3_l = 1.0;
var rng = RandomNumberGenerator.new()
var t = 0;
var t_d = 0;
var random_target = 0.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	
	rng.randomize();
	p_l1 = $Pillar/Pillar.get_surface_material(0).emission_energy;
	p_l2 = $Pillar2/Pillar.get_surface_material(0).emission_energy;
	p_l3 = $Pillar3/Pillar.get_surface_material(0).emission_energy;
	
	pl1_l = $Pillar/PillarLight.light_energy;
	pl2_l = $Pillar2/PillarLight.light_energy;
	pl3_l = $Pillar3/PillarLight.light_energy;
	
	cb_l = $CornerBlocks/CornerBlocks.get_surface_material(0).emission_energy;
	cs_l = $CornerSpikes/CornerSpikes.get_surface_material(0).emission_energy;
	
	
	pass # Replace with function body.



func _process(delta):
	if flicker == 1 :
		var r_l = 3.0;
		if t == 0 && random_target == 0:
			while(random_target == 0):
				random_target = rng.randf_range(0,r_l);
			t_d = 0;
			
		if random_target != 0 && t_d == 0:
			t += 0.05
		if random_target != 0 && t_d == 1:
			t -= 0.05
			
		if t >= 1:
			t_d = 1;
		if t <= 0 && t_d == 1:
			t_d = 0;
			t = 0;
			random_target = 0;
			
		print(t)
		$Pillar/Pillar.get_surface_material(0).emission_energy = p_l1 + random_target*t;
		$Pillar2/Pillar.get_surface_material(0).emission_energy = p_l2 + random_target*t;
		$Pillar3/Pillar.get_surface_material(0).emission_energy = p_l3 + random_target*t;
		$CornerBlocks/CornerBlocks.get_surface_material(0).emission_energy = cb_l + random_target*t;
		$CornerSpikes/CornerSpikes.get_surface_material(0).emission_energy = cs_l + random_target*t;
		$Pillar/PillarLight.light_energy = pl1_l + random_target*t;
		$Pillar2/PillarLight.light_energy = pl2_l+ random_target*t;
		$Pillar3/PillarLight.light_energy = pl3_l + random_target*t;
	pass

func smooth_trans(A,B):
	return A + (B - A) * t;

	
