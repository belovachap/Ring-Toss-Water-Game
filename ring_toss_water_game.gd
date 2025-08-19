extends Node3D

const WATER_MOLECULE = preload("res://water_molecule.tscn")
var water_counter = 0

func _ready() -> void:
	water_spiget_on()

func water_spiget_on() -> void:
	%Timer.start()

func water_spiget_off() -> void:
	%Timer.stop()

func _on_timer_timeout() -> void:
	if water_counter >= 200:
		water_spiget_off()
		
	water_counter += 1
	
	for i in range(20):
		var new_water_molecule = WATER_MOLECULE.instantiate()
		new_water_molecule.position = %WaterFaucet.global_position
		new_water_molecule.position.x += randf_range(-0.2, 0.2)
		new_water_molecule.position.y += randf_range(-0.2, 0.2)
		new_water_molecule.position.z += randf_range(-0.2, 0.2)
		%WaterMolecules.add_child(new_water_molecule)
