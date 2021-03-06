class TranslateSnippets < ActiveRecord::Migration

  def self.up
    ::Snippet.reset_column_information
    unless defined?(::Snippet::Translation) && ::Snippet::Translation.table_exists?
      ::Snippet.create_translation_table!({
        :body => :text
      }, {
        :migrate_data => true
      })
    end

    load(Rails.root.join('db', 'seeds', 'snippets.rb').to_s)
  end

  def self.down
    ::Snippet.reset_column_information

    ::Snippet.drop_translation_table!
  end

end