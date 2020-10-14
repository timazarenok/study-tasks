
class Intervals
  def initialize(times)
    @times = times.uniq!.sort
    @new_times = []
    @current_times = []
    @count = 0
  end

  def free_time

  end


  def sort_intervals
    (0..@times.size - 2).each do |i|
      compare(@times[i], @times[i+1])
    end
  end

  def add_new
    @new_times.push([@current_times[0][0], @current_times[@current_times.size-1][1]])
  end
  
  def compare(first, second)
    if first[1] >= second[0]
      @count += 1
      @current_times.push(first)
    else
      if @count > 0
        @count = 0 
        @current_times.push(first)
        add_new
      else
        @new_times.push(first)
      end
    end
  end
end

arr = [['10:00', '10:20'], ['10:40', '11:00'], ['10:50', '12:00'], ['12:00', '13:00'], ['10:00', '10:20'], ['12:40', '14:00'], ['16:50', '15:00']]
result = Intervals.new(arr)
result.sort_intervals
p result