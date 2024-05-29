class Calculator
  def add(input)
    comma = ','
    if input.start_with?("//")
      comma = input[2]
      input = input[4..-1]
    end

    input.gsub!("\n", comma)

    sum = 0
    input.split(comma).each do |num|
      n = num.to_i
      raise "negative numbers not allowed #{n}" if n < 0
      sum += n
    end

    sum
  end
end

# Commenting this for running the Rspec
# print "Enter the number: "
# number = gets.chomp.to_s
# Calculator.new.add number
