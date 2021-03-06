module Quality
  module Tools
    # Adds 'bigfiles' tool support to quality gem
    module Bigfiles
      private

      def bigfiles_args
        args = ['--glob', "'#{source_files_glob}'"]
        if exclude_files.size > 0
          args << ['--exclude-glob', "'#{source_files_exclude_glob}'"]
        end
        args.join(' ')
      end

      def quality_bigfiles
        ratchet_quality_cmd('bigfiles',
                            args: bigfiles_args) do |line|
          line.split(':')[0].to_i
        end
      end
    end
  end
end
