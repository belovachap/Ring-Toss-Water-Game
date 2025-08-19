extends Node3D

const WATER_MOLECULE = preload("res://water_molecule.tscn")
const RING = preload("res://ring.tscn")
var water_counter = 0
var ring_counter = 0

func _ready() -> void:
	water_spiget_on()

func water_spiget_on() -> void:
	%Timer.start()

func water_spiget_off() -> void:
	%Timer.stop()

func _on_timer_timeout() -> void:
	if water_counter >= 30:
		water_spiget_off()
		
	water_counter += 1
	ring_counter += 1
	
	if ring_counter % 3 == 0:
		var new_ring = RING.instantiate()
		new_ring.position = %WaterFaucet.global_position
		new_ring.position.x += randf_range(-0.2, 0.2)
		new_ring.position.y += randf_range(-0.2, 0.2)
		new_ring.position.z += randf_range(-0.2, 0.2)
		%Rings.add_child(new_ring)
	
	for i in range(20):
		var new_water_molecule = WATER_MOLECULE.instantiate()
		new_water_molecule.position = %WaterFaucet.global_position
		new_water_molecule.position.x += randf_range(-0.2, 0.2)
		new_water_molecule.position.y += randf_range(-0.2, 0.2)
		new_water_molecule.position.z += randf_range(-0.2, 0.2)
		%WaterMolecules.add_child(new_water_molecule)

func _on_button_pressed() -> void:
	%Pump.on = true
	await get_tree().create_timer(0.1).timeout
	%Pump.on = false
