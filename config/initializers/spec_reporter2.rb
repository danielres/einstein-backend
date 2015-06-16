module Minitest
  module Reporters
    class SpecReporter2 < SpecReporter

      def record(test)
        test.name.gsub!(/^test_\d{4}_/, '')
        print pad_test(test.name)
        print_colored_status(test)
        print(" (%.2fs)" % test.time) unless test.time.nil?
        puts
        if !test.skipped? && test.failure
          print_info(test.failure)
          puts
        end
      end


    protected

      def before_suite(suite)
        puts
        out = "#{suite}\n".sub('::', ' › ')
        print(bold { out })
      end

    end
  end
end
