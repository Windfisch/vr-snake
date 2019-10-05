extends ARVRCamera

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var last_angle = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fix(a):
	while a < -PI: a+=2*PI
	while a > PI: a-=2*PI
	return a

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = self.translation
	pos.y = 0.75
	var diff = pos - $"../../SnakeHead".translation
	
	var angle = fix(atan2(diff.z, diff.x))
	var rel_angle = fix(angle - last_angle)
	
	var rad_per_sec = PI/4
	var m_per_sec = 0.2
	
	print(rel_angle)
	
	if abs(rel_angle) < delta*rad_per_sec:
		$"../../SnakeHead".set_color(Color(0,1,0))
		# that's fine
		pass
	elif abs(rel_angle) < PI/2:
		# that's too much
		$"../../SnakeHead".set_color(Color(1,1,0))
		rel_angle = sign(rel_angle) * delta*rad_per_sec
		angle = fix( last_angle + rel_angle )
	else:
		# we're behind our snake
		$"../../SnakeHead".set_color(Color(1,0,0))
		angle = last_angle
		
	last_angle = angle
	
	var direction = Vector3(cos(angle), 0, sin(angle))
	$"../../SnakeHead".translation += direction * delta * m_per_sec
	
	#if diff.length() > 0.2:
	#	$"../../SnakeHead".set_color(Color(1,0,0))
	#else:
	#	$"../../SnakeHead".set_color(Color(0,1,0))
		
	
	
	#var newdiff = diff.normalized() * (1-pow(0.5, delta*50)) * max(0, diff.length() - 0.0)
	#$"../../SnakeHead".translation += newdiff
#	pass
