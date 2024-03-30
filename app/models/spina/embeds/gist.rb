module Spina::Embeds
  class Gist < Spina::Embeds::Base
    attributes :url

    # You can use Rails validations on your attributes
    validates :url, presence: true

    # Pick an icon at https://heroicons.com
    # and it'll show up in the list of embeddable components
    heroicon "chip"

    # If you want to render your embeddable component differently in Trix,
    # you can choose to render a different partial
    # Default: _gist.html.erb
    #
    # def to_trix_partial_path
    #  "spina/embeds/gists/trix_gist"
    # end
  end
end
