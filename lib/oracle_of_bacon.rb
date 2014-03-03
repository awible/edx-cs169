require 'debugger'              # optional, may be helpful
require 'open-uri'              # allows open('http://...') to return body
require 'cgi'                   # for escaping URIs
require 'nokogiri'              # XML parser
require 'active_model'          # for validations

class OracleOfBacon

  class InvalidError < RuntimeError ; end
  class NetworkError < RuntimeError ; end
  class InvalidKeyError < RuntimeError ; end

  attr_accessor :from, :to
  attr_reader :api_key, :response, :uri
  
  include ActiveModel::Validations
  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :api_key
  validate :from_does_not_equal_to

  def from
	(@from == nil && @to != nil) ? "Kevin Bacon" : @from
  end

  def to
	(@to == nil && @from != nil) ? "Kevin Bacon" : @to
  end

  def from_does_not_equal_to
    # YOUR CODE HERE
	#validates_with(@from, @to, {if @from ! 
	if (@from == @to) then
	  errors.add(:base, 'From and To are equal')
	  false
	else
	  true
	end
  end

  def initialize(api_key='')
    # your code here
	@api_key = api_key
  end

  def find_connections
    make_uri_from_arguments
    begin
      xml = URI.parse(uri).read
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError,
      Net::ProtocolError => e
      # convert all of these into a generic OracleOfBacon::NetworkError,
      #  but keep the original error message
      # your code here
    end
    # your code here: create the OracleOfBacon::Response object
  end

  def make_uri_from_arguments
    # your code here: set the @uri attribute to properly-escaped URI
    #   constructed from the @from, @to, @api_key arguments
	#@uri = "oracleofbacon.org/cgi-bin/xml?p=" + @api_key + "&a=" + @from.gsub(' ','+') + "&b=" + (@to==nil ? "Kevin+Bacon" : @to.gsub(' ','+'))
	@uri = URI.encode("http://oracleofbacon.org/cgi-bin/xml?p=" + @api_key + "&a=" + self.from.gsub(' ','+') + "&b=" + self.to.gsub(' ','+'))
  end
      
  class Response
    attr_reader :type, :data
    # create a Response object from a string of XML markup.
    def initialize(xml)
      @doc = Nokogiri::XML(xml)
      parse_response
    end

    private

    def parse_response
      if ! @doc.xpath('/error').empty? 
        parse_error_response

      # your code here: 'elsif' clauses to handle other responses
      # for responses not matching the 3 basic types, the Response
      # object should have type 'unknown' and data 'unknown response'
	  elsif @doc.root.name == "link"
		@type = :graph
		@data = Array.new()
		@doc.root.element_children.each do |actor_or_movie| 
		  @data << actor_or_movie.text
		end
	  elsif @doc.root.name == "spellcheck"
		@type = :spellcheck
		@data = Array.new()
		@doc.root.element_children.each do |match|
		  @data << match.text
		end
	  else
		@type = :unknown
		@data = "unknown"
      end
    end
    def parse_error_response
      @type = :error
      @data = 'Unauthorized access'
    end
  end
end

