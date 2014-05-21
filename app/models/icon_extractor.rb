class IconExtractor
  attr_reader :apk_file, :icon

  def initialize(apk_file)
    @apk_file = apk_file
    @apk_dir  = Dir.mktmpdir
    validate_file
    extract_resources

    if File.file?(@apk_dir + "/AndroidManifest.xml")
      parse_manifest
      find_best_icon
    end
  end

  private

    def validate_file
      raise "#{apk_file} is not a file" unless File.file?(apk_file)
    end

    def extract_resources
      `apktool decode --no-src --force "#{@apk_file}" "#{@apk_dir}"`
    end

    def parse_manifest
      doc = Nokogiri::XML(File.read(@apk_dir + '/AndroidManifest.xml'))
      app = doc.css('application').first
      @icon_name = app.attr('android:icon').gsub('@drawable/', '')
    end

    def find_best_icon
      candidates = Dir.glob(File.join(@apk_dir, "**", @icon_name + ".*"))
      # Assume longest file path is highest quality (based on drawable-x*nhdpi)
      @icon =  candidates.sort_by(&:length).last
    end
end