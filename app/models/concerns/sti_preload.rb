# Used to preload STI Base Class descendants
#   This ensures "descendants" method works for STI base classes
# see: https://guides.rubyonrails.org/autoloading_and_reloading_constants.html#single-table-inheritance
# Should be included in Base Class via `require "sti_preload"` & `include StiPreload`
# e.g. see app/models/page_scan.rb
module StiPreload
  unless Rails.application.config.eager_load
    extend ActiveSupport::Concern

    included do
      cattr_accessor :preloaded, instance_accessor: false
      cattr_writer :sti_model_file_pattern, instance_accessor: false
    end

    class_methods do
      def descendants
        return super if Rails.configuration.eager_load

        preload_sti_via_model_file_regex unless preloaded

        # NOTE: preload via db inheritance requires entries in db for each child.
        #  This isn't always likely, especially during testing. Using file pattern instead.

        # preload_sti_via_db_inheritance_column unless preloaded

        super
      end

      # File Pattern used to find children models, defaults to ending in base model file name
      # Can override via `sti_model_file_pattern=`
      def sti_model_file_pattern
        @sti_model_file_pattern ||= "*#{base_class.to_s.underscore}.rb"
      end

      # Constantizes all types present in the database. There might be more on
      # disk, but that does not matter in practice as far as the STI API is
      # concerned.
      #
      # Assumes store_full_sti_class is true, the default.
      def preload_sti_via_db_inheritance_column
        types_in_db = \
          base_class.
            unscoped.
            select(inheritance_column).
            distinct.
            pluck(inheritance_column).
            compact

        types_in_db.each do |type|
          logger.debug("Preloading STI type #{type}")
          type.constantize
        end

        self.preloaded = true
      end

      # Requires all files that follow the sti_model_file_pattern (defaults to base class file name)
      def preload_sti_via_model_file_regex
        Rails.logger.debug "Preloading STI model files by pattern: #{sti_model_file_pattern.inspect}..."
        # Populate PageScan.descendants by loading children
        Dir[Rails.root.join('app', 'models', sti_model_file_pattern)].each do |scan_model_file|
          Rails.logger.debug "Preloading STI model file: #{scan_model_file.inspect}..."
          require_dependency scan_model_file
        end

        self.preloaded = true
        # WARN: list descendants AFTER setting preloaded=true (otherwise creates infinite loop)
        Rails.logger.debug "PageScan.descendants==#{PageScan.descendants.collect(&:name)}"
      end
    end
  end
end
