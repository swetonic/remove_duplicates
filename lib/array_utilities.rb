
module ArrayUtilities

  def eliminate_duplicates(email_addresses_array)
    output_array = []
    encountered = {}
    email_addresses_array.each do |email_address|
      unless encountered.key?(email_address)
        encountered[email_address] = ''
        output_array << email_address
      end
    end
    output_array
  end

end