class BikeResult < LegResult

	field :mph, type: Float

	def calc_ave
		if event && secs
			self.mph = event.miles / (secs/3600)
		end
	end
end