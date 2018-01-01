module Station
  class Puls FM < Format::HTML
    config do
      id "pulsfm"
      url "http://stream.pulsfm.se:8908/"
    end

    def process
      artist, song = split(
        data.at_css("p:nth-child(11)").
        text.sub("Currently playing:", "")
      )
      { song: song, artist: artist }
    end
  end
end
