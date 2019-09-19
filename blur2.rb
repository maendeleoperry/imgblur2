class Image

  def initialize
    @view = ([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
  end

  def output_image
    @view.each do |row|
      puts row.join("")
    end
  end

  def blur!(distance=1)
    distance.times do
      blur_points!
  # This method finds the distance,1, from all indexes with a value of 1.    
    end
  end

  private

    def blur_points!
      blur_points = []
      @view.each_with_index do |row, i|
        row.each_with_index do |x, row_i|
          blur_points << [i, row_i] if x == 1
  # This method iterates through each row and element
  # and any index with a value of one is stored into the array
  # "blur_points!".       
        end
      end

      blur_points.each do |point|
        @view[point[0]][point[1] + 1] = 1 if point[1] + 1 <= @view[point[0]].length - 1
        @view[point[0]][point[1] - 1] = 1 if point[1] - 1 >= 0
        @view[point[0] + 1][point[1]] = 1 if point[0] + 1 <= @view.length - 1
        @view[point[0] - 1][point[1]] = 1 if point[0] - 1 >= 0
  # This method is the index value modifier.  It is iterating through
  # the stored indexes with val 1, and any index within a distance of one
  # index whos value is zero is converted to a value of 1.      
      end
    end

end

image = Image.new
image.blur!(1)
# This call can be run for distance 1 or more 
# depending on argument value.
image.output_image