extends Area3D

var on = false

func _physics_process(delta: float) -> void:
	if not on:
		return

	for body in get_overlapping_bodies():
		body.linear_velocity += global_transform.basis.y * 2
