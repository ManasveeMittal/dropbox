import webbrowser

class Movie():
	def __init__(self,title,plot,poster,trailer):
		self.title = title
		self.plot = plot
		self.poster = poster
		self.trailer = trailer

	def show_trailer(self):
		webbrowser.open(self.trailer)

	def show_poster(self):
		webbrowser.open(self.poster)



# afunction that is is defined in a class and is associated with an instance is called an instance method
