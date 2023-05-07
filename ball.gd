extends RigidBody2D

signal unfrozen
signal speeding(val: int)

func _physics_process(delta: float) -> void:
	var velocity: Vector2
	velocity = PhysicsServer2D.body_get_state(get_rid(),PhysicsServer2D.BODY_STATE_LINEAR_VELOCITY)
	var speed: float = velocity.length_squared()/1000000
#	print(speed)
	if speed > 1:
		speeding.emit(speed)
		$Trail.emitting = true
	else:
		$Trail.emitting = false

func stop():
	PhysicsServer2D.body_set_state(get_rid(),PhysicsServer2D.BODY_STATE_LINEAR_VELOCITY, Vector2.ZERO)

func unfreeze():
	if freeze:
		freeze = false
		unfrozen.emit()

func floor_hit():
	$FloorHit.emitting = true

func disable():
	process_mode = Node.PROCESS_MODE_DISABLED
