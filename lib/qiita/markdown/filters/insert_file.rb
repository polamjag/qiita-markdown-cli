module Qiita
  module Markdown
    module Filters
      class Execute < HTML::Pipeline::Filter
        def call
          doc.search(%{code}).each do |e|
            if e.text =~ /^!/
              e.replace %x(#{e.text.sub(/^!/, '')})
            end
          end
          doc.search(%{div.code-frame[data-lang="exec"]}).each do |e|
            e.replace %x(#{e.text})
          end
          doc
        end
      end
    end
  end
end
