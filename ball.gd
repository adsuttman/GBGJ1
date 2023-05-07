extends RigidBody2D

var speed_points: int = 0

func _physics_process(delta: float) -> void:
	var velocity: Vector2
	velocity = PhysicsServer2D.body_get_state(get_rid(),PhysicsServer2D.BODY_STATE_LINEAR_VELOCITY)
	var speed = velocity.length_squared()/1000000
	speed_points += speed
	print(speed_points)
