class DirectorsController < ApplicationController

  def index
    render ({:template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")
    matching_director = Director.where({ :id => the_id})
    @the_dir = matching_director.at(0)
    render ({:template => "director_templates/details"})
  end

  def junior
    @director = Director.where.not({ :dob => nil }) 
    @dob = @director.max_by(&:dob)
    time = Time.new(@dob.dob.year, @dob.dob.month, @dob.dob.day)
    @formatted_time = time.strftime("%B %e%t, %Y")
    render ({:template => "director_templates/youngest"})
  end

  def senior
    @director = Director.where.not({ :dob => nil }) 
    @dob = @director.min_by(&:dob)
    time = Time.new(@dob.dob.year, @dob.dob.month, @dob.dob.day)
    @formatted_time = time.strftime("%B %e%t, %Y")
    render ({:template => "director_templates/eldest"})
  end

end
