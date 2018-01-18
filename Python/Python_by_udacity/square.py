import turtle

def draw_shapes():
	window = turtle.Screen()
	window.bgcolor("grey")

	brad = turtle.Turtle()
	brad.shape("turtle")
	brad.color("white")
	brad.speed(5)
	for i in range(4):
		brad.forward(141)
		brad.right(90)
	angie = turtle.Turtle()
	angie.right(135)
	angie.shape("arrow")
	angie.color("white")
	angie.circle(100)	

	tri = turtle.Turtle()
	tri.left(100)
	tri.shape("arrow")
	tri.color("white")
	
	for i in range(3):
		tri.right(120)
		tri.fd(173)

	window.exitonclick()
'''
def draw_shape(name=,cursor=,color = white, bg_color="grey",right_deg =0, right_steps =0, left_deg=0,left_steps=0,back_ =, forward_ = ):
	window = turtle.Screen
	window.bgcolor(bg_color)
	model = turtle.Turtle()
	print(name)
	for i in range(right_steps):
		model.forward(forward_)
		model.right(right_deg)


	#supposedly screen ang bg color given

draw_shape(name = "square",bg_color = grey, right_deg=90,right_steps = 4,forward_ =90 )
'''

window = turtle.Screen()
window.bgcolor("grey")

def shape_1():
	brad = turtle.Turtle()
	brad.shape("turtle")
	brad.color("white")
	brad.speed(100)
	for j in range(10):
		brad.right(36)
		for i in range(4):
			brad.forward(100)
			brad.right(90)
	window.exitonclick()
	print("shape created")

# shape_1()
draw_shapes()



