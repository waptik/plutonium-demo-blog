require_relative "../blogging"

class Blogging::Post < Blogging::ResourceRecord
  # add concerns above.

  # add constants above.

  # add enums above.

  # add model configurations above.

  # add belongs_to associations above.

  # add has_one associations above.

  # add has_many associations above.

  # add attachments above.

  scope :published, -> { where(published: true) }
  scope :draft, -> { where(published: [false, nil]) }

  # add scopes above.

  validates :title, presence: true
  validates :body, presence: true
  # add validations above.

  # add callbacks above.

  # add delegations above.

  # add misc attribute macros above.

  # add methods above. add private methods below.
end
