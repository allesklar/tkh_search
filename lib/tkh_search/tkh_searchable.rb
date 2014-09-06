module TkhSearch
  module TkhSearchable

    # to enable the initializer
    mattr_accessor :indexable_models

    # Class methods

    def tkh_searchable
      include TkhSearch::TkhSearchable::LocalInstanceMethods
      after_save :index_record
    end

    def reverse_indexing
      # Any model must have a self.tkh_search_indexable_fields class method returning
      # a hash of "field_name: :strength" pairs to be indexed
      if defined? self.tkh_search_indexable_fields
        # Index all records of the given model
        self.all.each do |record|
          index_individual_record(record)
        end
      else # no fields have been set in the model
        "The model '#{self.name}' has no fields marked for indexing."
      end
    end

    def index_individual_record(record)
      words = {}
      # Loop through each indexable field
      self.tkh_search_indexable_fields.each do |field_name, strength|
        # Remove html tags, transform to lowercase and split words
        # Splitting only with spaces because we want to preserve devanagari characters
        Sanitize.fragment(record.send(field_name)).downcase.split.each do |word|
          if words[word] # add strength to existing word rating
            words[word] += strength
          else # new word
            words[word] = strength # create a new word pair
          end
        end
      end
      populate_index_tables( words, record )
    end

    private

    def populate_index_tables( words, record )
      # populate tkh_search_terms and tkh_search_instances tables
      words.each do |word,strength|
        term = TkhSearchTerm.find_or_create_by( word: word )
        instance = TkhSearchInstance.find_or_create_by(
                    model_name: self.name,
                    model_record_id: record.id,
                    tkh_search_term_id: term.id )
        instance.rating   = strength
        instance.language = I18n.locale
        defined?(record.published?) ? instance.published = record.published? : instance.published = false
        instance.save!
      end
    end

    module LocalInstanceMethods
      def index_record
        # get record's model name, constantize it, and call the indexing class method
        (Kernel.const_get self.class.name).index_individual_record(self)
        remove_obsolete_instances(self)
      end

      private

      def remove_obsolete_instances(record)
        # after an individual record save and the record has been reindexed
        # we need to remove indexed instances for words which have been deleted
        obsolete_instances = TkhSearchInstance.where( 'model_name = ? and model_record_id = ?', record.class.name, record.id ).a_bit_old
        obsolete_instances.each do |instance|
          instance.destroy!
        end
      end
    end

  end
end
