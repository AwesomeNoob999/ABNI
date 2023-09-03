blocks=["▁","▂","▃","▄","▅","▆","▇","█"]
world = []
buffer = []

require_relative "noise.rb"

def sine(a,b,c,d) 
    Waves.new.sine(a,b,c,d)
end
def triangle(a,b,c,d)
    Waves.new.triangle(a,b,c,d)
end
#triangle(i,1,0.4,0.7).abs
#155.times do |i|
#    buffer << (sine(i,1.0,25,6).abs)
#end
index = 0
25.times do |x|
    buffer << []
    p = rand(9)
    f = rand((20..45))
    25.times do |y|
	buffer[x] << sine(y,1.0,f,p)
    end
end
buffer2 = []
cache = buffer[0]
for x in buffer
    buffer2 << []
    tmp = 0
    for y in x
	begin
	    buffer2[index] << (y + (buffer[index+1][tmp]*0.75)) / 2
	rescue NoMethodError
	    buffer2[index] << (y + (cache[tmp]*0.75))
	end
	tmp +=1
    end
    index +=1
end

index = 0

for x in buffer2
    world << []
    for i in x
	if i <= 0.125
	    world[index] << blocks[0]
	elsif i <= 0.25
	    world[index] << blocks[1]
	elsif i <= 0.375
	    world[index] << blocks[2]
	elsif i <= 0.50
	    world[index] << blocks[3]
	elsif i <= 0.625
	    world[index] << blocks[4]
	elsif i <= 0.75
	    world[index] << blocks[5]
	elsif i <= 0.875
	    world[index] << blocks[6]
	elsif i <= 1.0
	    world[index] << blocks[7]
	else
	    world[index] << "▓"
	end
    end
    index +=1 
end

for x in world
    for i in x 
	print i
    end
    print "\n"
end
