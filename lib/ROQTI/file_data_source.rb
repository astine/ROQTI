class FileDataSource < DataSource
  def initialize (source_dir)
    @source_dir = source_dir
    @source_dir = @source_dir + "/" unless @source_dir[-1] == "/"
    @data = {}
    load_all
  end
  
  def load(security_name)
    headers, data = File_handler.new(@source_dir + security_name + ".csv").read
    headers = headers [1..-1].join(",").downcase().gsub(" ", "_").split(",")
    
    for data_line in data
      year, month, day = data_line [0].split("-") 
      @data[security_name] = {} if !@data.has_key?(security_name)
      @data[security_name][year] = {} if !@data[security_name].has_key?(year)
      @data[security_name][year][month] = {} if !@data[security_name][year].has_key?(month)
      @data[security_name][year][month][day] = {}
      for data_item in headers.zip(data_line[1..-1])
        @data[security_name][year][month][day][data_item[0]] = data_item[1]
      end      
    end  
  end
  
  def load_all
    Dir[@source_dir + "*"].each do |file|
      file.slice! @source_dir
      load(file.split(".").first)
    end
  end  
  
  def retrieve (security_name, year, month, day)
    return @data[security_name][year][month][day]
  end
end
