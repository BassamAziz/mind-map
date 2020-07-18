require 'rails_helper'

RSpec.describe Topic, type: :model do
  context 'when topic is a root' do
    let(:mind_map) { FactoryBot.build(:topic, :root) }

    it 'has no parent topic' do
      expect(mind_map).to be_valid
      expect(mind_map.parent).to be_nil
    end
  end

  context 'when topic is a root child' do
    let(:root_child) { FactoryBot.build(:topic, :root_child) }

    it 'has a root topic as parent' do
      expect(root_child).to be_valid
      expect(root_child.parent.level).to eq 0
    end
  end

  context 'when topic is a level 2' do
    let(:lvl_2_topic) { FactoryBot.build(:topic, :level_2) }

    it 'has a root child topic as parent' do
      expect(lvl_2_topic).to be_valid
      expect(lvl_2_topic.parent.level).to eq 1
    end
  end

  context 'when searching the user maps' do
    let(:user) { FactoryBot.create(:user) }
    let(:user_mind_maps) { FactoryBot.create_list(:topic, 5, :root_child, user: user)}
    let!(:extra_mind_maps) { FactoryBot.create_list(:topic, 5, :root_child)}

    it 'lists all mind maps of a user' do
      expect(Topic.where(user: user)).to eq user_mind_maps
    end
  end

  context 'when searching for topics by title' do
    let!(:topics) { FactoryBot.create_list(:topic, 5, :level_2) }

    it 'returns root, root children and level 2 topics that match title' do

      expect(Topic.where("title LIKE '%root child topic%'").count).to eq 5
      expect(Topic.where("title LIKE '%topic%'").count).to eq 15
    end
  end
end
