class IconExtractionJob
  @queue = :icon_extraction

  def self.perform(build_id)
    @build = Build.find(build_id)
    @app = @build.app
    @app.update_attributes!(icon: File.open(IconExtractor.new(@build.apk.file.file).icon))
  end

end