atom_feed :language => 'ru-RU' do |feed|
  feed.title "Книжная полка"
  feed.updated @updated

  reviews.each do |item|
    next if item.updated_at.blank?

    feed.entry(item) do |entry|
      entry.url review_path(item)
      entry.title "#{item.book.author} «#{item.book}»"
      entry.content item.body, :type => 'html'
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
    end
  end
end