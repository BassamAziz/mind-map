class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :parent, class_name: 'Topic', optional: true

  enum operator: { root: 0, root_child: 1, level_2: 2, level_3: 3 }
end
