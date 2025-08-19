extends Node3D

const WATER_MOLECULE = preload("res://water_molecule.tscn")

func _on_timer_timeout() -> void:
	var new_water_molecule = WATER_MOLECULE.instantiate()
	new_water_molecule.position = %WaterFaucet.global_position
	%WaterMolecules.add_child(new_water_molecule)
