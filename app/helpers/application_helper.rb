module ApplicationHelper
  def ugly_lyrics(lyrics)
    lyrics_array = lyrics.split(" ")
    new_lyrics = []

    until lyrics_array.empty?
      new_line = "♫"

      if lyrics_array.count >= 5
        5.times { new_line += " " + lyrics_array.shift }
      else
        lyrics_array.count.times { new_line += " " + lyrics_array.shift }
      end
      new_lyrics << new_line
    end

    new_lyrics
  end

end
