require "rails_helper"
require "alchemy/tasks/usage"

RSpec.describe Alchemy::Tasks::Usage do
  describe ".elements_count_by_name" do
    subject { described_class.elements_count_by_name }

    before do
      create_list(:alchemy_element, 3, name: "headline")
      create_list(:alchemy_element, 2, name: "bild")
      create(:alchemy_element, name: "text")
    end

    it "returns the elements count by name" do
      expect(subject).to match_array [
        hash_including({"name" => "headline", "count" => 3}),
        hash_including({"name" => "bild", "count" => 2}),
        hash_including({"name" => "text", "count" => 1}),
        hash_including({"name" => "all_you_can_eat", "count" => 0}),
        hash_including({"name" => "all_you_can_eat_ingredients", "count" => 0}),
        hash_including({"name" => "article", "count" => 0}),
        hash_including({"name" => "contactform", "count" => 0}),
        hash_including({"name" => "download", "count" => 0}),
        hash_including({"name" => "element_with_content_groups", "count" => 0}),
        hash_including({"name" => "element_with_ingredient_groups", "count" => 0}),
        hash_including({"name" => "element_with_ingredients", "count" => 0}),
        hash_including({"name" => "element_with_warning", "count" => 0}),
        hash_including({"name" => "erb_cell", "count" => 0}),
        hash_including({"name" => "erb_element", "count" => 0}),
        hash_including({"name" => "gallery", "count" => 0}),
        hash_including({"name" => "gallery_picture", "count" => 0}),
        hash_including({"name" => "header", "count" => 0}),
        hash_including({"name" => "left_column", "count" => 0}),
        hash_including({"name" => "menu", "count" => 0}),
        hash_including({"name" => "news", "count" => 0}),
        hash_including({"name" => "old", "count" => 0}),
        hash_including({"name" => "right_column", "count" => 0}),
        hash_including({"name" => "search", "count" => 0}),
        hash_including({"name" => "slide", "count" => 0}),
        hash_including({"name" => "slider", "count" => 0}),
      ]
    end
  end

  describe ".pages_count_by_type" do
    subject { described_class.pages_count_by_type }

    before do
      create_list(:alchemy_page, 2, page_layout: "standard")
      create(:alchemy_page, page_layout: "home")
    end

    it "returns the pages count by type" do
      expect(subject).to eq [
        {"page_layout" => "standard", "count" => 2},
        {"page_layout" => "home", "count" => 1},
        {"page_layout" => "index", "count" => 1},
        {"page_layout" => "contact", "count" => 0},
        {"page_layout" => "erb_layout", "count" => 0},
        {"page_layout" => "everything", "count" => 0},
        {"page_layout" => "footer", "count" => 0},
        {"page_layout" => "news", "count" => 0},
        {"page_layout" => "readonly", "count" => 0},
      ]
    end
  end
end
