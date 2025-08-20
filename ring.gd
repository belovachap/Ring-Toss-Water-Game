extends RigidBody3D

const GREEN_RING_MATERIAL = preload("res://green_ring_material.tres")
const RED_RING_MATERIAL = preload("res://red_ring_material.tres")

func _process(delta: float) -> void:
	# The pegs are on collision mask 2
	if %RayCast3D.is_colliding():
		$CSGTorus3D.material = GREEN_RING_MATERIAL
	elif %RayCast3D2.is_colliding():
		$CSGTorus3D.material = GREEN_RING_MATERIAL
	elif %RayCast3D3.is_colliding():
		$CSGTorus3D.material = GREEN_RING_MATERIAL
	elif %RayCast3D4.is_colliding():
		$CSGTorus3D.material = GREEN_RING_MATERIAL
	else:
		$CSGTorus3D.material = RED_RING_MATERIAL
