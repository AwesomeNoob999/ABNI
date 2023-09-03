class Waves
    def initialize
    end
    def sine(degrees, amplitude, frequency,phase)
	@radians = to_radians(degrees)
	@result = amplitude * Math.sin(@radians * frequency + phase)
	return @result
    end
    def to_radians(degrees)
	@result = (degrees * Math::PI) / 180
	return @result
    end
    def cosine(degrees, amplitude, frequency,phase)
	@radians = to_radians(degrees)
	@result = amplitude * Math.cos(@radians * frequency + phase)
	return @result
    end
    def square(degrees, amplitude, frequency,phase)
	@radians = to_radians(degrees)
	@result = (amplitude * Math.sin(@radians * frequency + phase)).round(0)
	return @result
    end
    def triangle(degrees, amplitude, frequency,phase)
	@radians = to_radians(degrees)
	@result = ((4*amplitude / frequency)*((( @radians - frequency/phase) % frequency) - frequency/2).abs - amplitude)
	return @result
    end
end
