class ResumePdf < Prawn::Document
  def initialize(resume)
    super()
    @y_position = cursor - 10
    @resume = resume
    header
    profile
    employment
    skills
    # table_content
  end

  def header

    bounding_box([20, @y_position], :width => 270, :height => 300) do
      text "#{@resume.first_name}" + " " + "#{@resume.last_name}", size: 30, style: :bold
      text "Robot Coder Ninja", size: 20
    end

    bounding_box([260, @y_position], :width => 270, :height => 80) do
      text "e: #{@resume.email}", size: 10, align: :right
      text "w: RobotCoderNinja.com", size: 10, align: :right
      text "m: #{@resume.phone_1}", size: 10, align: :right
      text "#{@resume.address}", size: 10, align: :right
      text "#{@resume.city}" + ", " + "#{@resume.state}" + "#{@resume.postal_code}", size:10, align: :right
    end

  stroke_color "ff0000"
  stroke do
     horizontal_rule
  end

  def profile
    move_down 10
    bounding_box([20, @y_position - 100], :width => 270, :height => 20) do
      text "Personal Profile", size: 18, align: :left
    end

    bounding_box([150, @y_position - 105], :width => 270, :height => 20) do
      text "Instant Robot Coder Ninja! Just add coffee.", size:12, align: :right
    end

    stroke_color "ff0000"
      stroke do
         horizontal_rule
      end
    end
  end

  def employment
    move_down 10
    bounding_box([20, @y_position - 140], :width => 270, :height => 180) do
      text "Work", size:18, align: :left
      text "Experience", size:18, align: :left
    end

    count = 0
    exp = @resume.experiences.each do |exp|
      count += 1
      @y1 = @y_position - 55 - (count * 90)
      bounding_box([180, @y1], :width => 270, :height => 180) do
        # binding.pry
        text "#{exp.company_name}", size: 18, align: :left
        text "#{exp.position}", size: 14, align: :left, style: :italic
        text "#{exp.summary}", size: 14, align: :left
      end
      move_up 100
    end

    # stroke_color "ff0000"
      stroke do
         horizontal_rule
      end
    end

  def skills
    move_down 10
    bounding_box([20, @y1 - 100], :width => 270, :height => 180) do
      text "Skills", size:18, align: :left
    end

    count = 0
    exp = @resume.skills.each do |skill|
      count += 1
      @y2 = @y1 - 55 - (count * 20)
      float do
        bounding_box [170, @y2 - 30], :width => 10 do
          text "•"
        end
      end
      bounding_box([180, @y2 - 30], :width => 270, :height => 140) do
        # binding.pry
        text "#{skill.name}", size: 14, align: :left
      end
      move_up 100
    end

    # stroke_color "ff0000"
      stroke do
         horizontal_rule
      end
    end

  # end

  # def table_content
  #   # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
  #   # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
  #   # Then I set the table column widths
  #   table resume_rows do
  #     row(0).font_style = :bold
  #     self.header = true
  #     self.row_colors = ['DDDDDD', 'FFFFFF']
  #     self.column_widths = [40, 300, 200]
  #   end
  # end
  #
  # def resume_rows
  #   [['#', 'Name', 'Price']] +
  #     @products.map do |product|
  #     [product.id, product.name, product.price]
  #   end
  # end
end
