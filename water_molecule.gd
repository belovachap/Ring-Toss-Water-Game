extends RigidBody3D

func _physics_process(delta: float) -> void:
	linear_velocity.x += randf_range(-1.0, 1.0)
	linear_velocity.y += randf_range(-1.0, 1.0)
	linear_velocity.z += randf_range(-1.0, 1.0)
