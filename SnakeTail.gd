extends CSGPolygon
tool

export (int) var subdivision = 8 setget set_subdivision
export (float) var radius = 1 setget set_radius
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func set_subdivision(s):
	subdivision = s
	update_poly()

func set_radius(r):
	radius = r
	update_poly()

# Called when the node enters the scene tree for the first time.
func _ready():
	update_poly()


func update_poly():
	var p = []
	for i in range(subdivision):
		var phi = 2*PI*i/subdivision
		p.append(Vector2(radius*cos(phi), radius*sin(phi)))
	self.polygon = PoolVector2Array(p)
	update_gizmo()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
