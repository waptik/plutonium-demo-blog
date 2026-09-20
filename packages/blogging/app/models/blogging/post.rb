require_relative "../blogging"

class Blogging::Post < Blogging::ResourceRecord
  # Previous version:
  #   belongs_to :user
  # In Rails 5+, belongs_to requires presence by default. Set optional: true so existing
  # posts from Chapter 2 without a user_id remain valid and can be updated.
  belongs_to :user, optional: true
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
