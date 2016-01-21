file_names = ['foo.m','bar.txt']

file_names.each do |file_name|
    File.rename(file_name, "bk"+file_name)
    File.open(file_name,"w") do |test|
    	File.open("bk"+file_name,'r') do |file|
	    order = 0
   	    file.each_line do | line|
		if ( line =~ /-\s*\(\s*void\s*\)\s*test/ )
		    order = order + 1
		    message = "_%02d_"%[order]
		    line.gsub!(Regexp.new('(-\s*\(\s*void\s*\)\s*test)(.*)'), '\1'+message+'\2')      	           
                    puts line
		end
      	        test.puts line
   	     end
         end
 
     end
end

