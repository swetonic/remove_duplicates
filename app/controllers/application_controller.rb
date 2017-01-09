require 'benchmark'

class ApplicationController < ActionController::Base
  include ArrayUtilities

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index

  end

  def upload

    #save file locally
    File.open(Rails.root.join('tmp', params[:text_file].original_filename), 'w+') do |file|
      file.write(params[:text_file].read)
    end

    @source_array = []
    #read the lines into array
    File.open(Rails.root.join('tmp', params[:text_file].original_filename), 'r+') do |file|
      file.each_line { |line| @source_array << line.strip }
    end

    @deduped_array = nil
    @processing_time = Benchmark.realtime { @deduped_array = eliminate_duplicates(@source_array) }
  end

end




