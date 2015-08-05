class Triangle
  attr_reader :sides

  def initialize(s1, s2, s3)
    @s1, @s2, @s3 = s1, s2, s3
    @sides = [@s1, @s2, @s3]
  end

  def kind
    case
      when invalid? then raise TriangleError
      when equilateral? then :equilateral
      when isosceles? then :isosceles
      when scalene? then :scalene
    end
  end

  private

  def equilateral?
    @sides.uniq.count == 1
  end

  def isosceles?
    @sides.uniq.count == 2
  end

  def scalene?
    @sides.uniq.count == 3
  end

  def invalid?
    case
      when @s1 + @s2 <= @s3 then true
      when @s2 + @s3 <= @s1 then true
      when @s3 + @s1 <= @s2 then true
      when @s1 == 0 && @s2 == 0 && @s3 == 0 then true
      when @s1 < 0 || @s2 < 0 || @s3 < 0 then true
    end
  end
end

class TriangleError < StandardError; end
