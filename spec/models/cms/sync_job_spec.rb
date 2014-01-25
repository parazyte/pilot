require 'spec_helper'

describe Cms::SyncJob do
  SERVER = "http://localhost:5000/"
  API = "/api/v1/"
  INDEX = 'index.json'

  context ".perform" do
    context "index" do
      let(:data) {
        {
            page: {
                header: {
                    text: "Gamers heaven",
                    image: SERVER + "images/header.jpg"
                },
                content:{
                    main_text: "Welcome to this gaming site, as you see it is very interesting and full of content",
                    games: [
                        {
                            id: 1,
                            name: "Superheroes 1",
                            url: API + "games/1.json"
                        },
                        {
                            id: 2,
                            name: "Rally 2.0",
                            url: API + "games/2.json"
                        }
                    ]
                },
                footer: {
                    text: "2014. Heyho"
                }

            }
        }.with_indifferent_access
      }
      let(:game1) {
        {page: {
                header: {
                    id: 1,
                    text: "Superheroes 1",
                    image: SERVER + "images/game1.jpg"
                },
                content:{
                    main_text: "Superheroes is an amazing fight game",
                }
            }
        }.with_indifferent_access
      }
      let(:game2) {
        {page: {
                header: {
                    id: 2,
                    text: "Rally 2.0",
                    image: SERVER + "images/game2.jpg"
                },
                content:{
                    main_text: "Joe says 'play Rally 2.0'",
                }
            }
        }.with_indifferent_access
      }

      before :each do
        Cms::SyncJob.
          any_instance.
          should_receive(:fetch_content).
          with(API + INDEX).
          at_least(:once).
          and_return(data)

        Cms::SyncJob.
          any_instance.
          should_receive(:fetch_content).
          with("/api/v1/games/1.json").
          at_least(:once).
          and_return(game1)

        Cms::SyncJob.
          any_instance.
          should_receive(:fetch_content).
          with("/api/v1/games/2.json").
          at_least(:once).
          and_return(game2)
      end

      it "index is created when it does not exist" do
        expect {
          Cms::SyncJob.perform
        }.to change(Cms::Page::Index, :count).by(1)
      end

      it "index attributes are updated when it exists" do
        index=Cms::Page::Index.new(cms_url: "index.json")
        index.build_header(text: "header text", image_path: "http://localhost:5000/images/header.jpg")
        index.build_content(main_text: "content")
        index.build_footer(text: "footer text")
        index.save!

        expect {
          Cms::SyncJob.perform
        }.to change(Cms::Page::Index, :count).by(0)
        index.reload
        index.header.text.should == "Gamers heaven"
        index.header.image_path.should == SERVER + "images/header.jpg"
        index.content.main_text.should == "Welcome to this gaming site, as you see it is very interesting and full of content"
        index.footer.text.should == "2014. Heyho"
      end

      it "updates or sets the header attributes" do
        Cms::SyncJob.perform
        index = Cms::Page::Index.first
        index.header.text.should == "Gamers heaven"
        index.header.image_path.should == SERVER + "images/header.jpg"
      end

      it "updates or sets the footer attributes" do
        Cms::SyncJob.perform
        index = Cms::Page::Index.first
        index.footer.text.should == "2014. Heyho"
      end

      it "updates or sets the content attributes" do
        Cms::SyncJob.perform
        index = Cms::Page::Index.first
        index.content.main_text.should == "Welcome to this gaming site, as you see it is very interesting and full of content"
      end

      it "creates a relationship between content and games" do
        Cms::SyncJob.perform
        index = Cms::Page::Index.first
        index.content.items.count.should == 2
      end

      context "games" do
        it "creates games as cms item pages" do
          expect {
            Cms::SyncJob.perform
          }.to change(Cms::Page::Item, :count).by(2)
        end

        it "sets the cms_url attribute" do
          Cms::SyncJob.perform
          items = Cms::Page::Item.all
          items.map(&:cms_url).should =~ ["/api/v1/games/2.json", "/api/v1/games/1.json"]
        end

        it "updates or sets the header attributes" do
          Cms::SyncJob.perform
          items = Cms::Page::Item.all
          items.map(&:header).map(&:text).should =~ ["Rally 2.0", "Superheroes 1"]
          items.map(&:header).map(&:image_path).should =~ [SERVER + "images/game2.jpg", SERVER + "images/game1.jpg"]
        end

        it "updates or sets the content attributes" do
          Cms::SyncJob.perform
          items = Cms::Page::Item.all
          items.map(&:content).map(&:main_text).should =~ ["Joe says 'play Rally 2.0'", "Superheroes is an amazing fight game"]
        end

        it "cms item page attributes are updated when an item with the same cms_url exists" do
          index=Cms::Page::Index.new(cms_url: "index.json")
          index.build_content(main_text: "content")
          updated_item = Cms::Page::Item.new(name: "Game1", cms_url: "/api/v1/games/1.json")
          updated_item.build_header(text: "header text game 1", image_path: "http://localhost:5000/images/game1.jpg")
          updated_item.build_content(main_text: "gamesgamesgames")

          not_in_response_item = Cms::Page::Item.new(name: "Game2", cms_url: "game2.json")
          not_in_response_item.build_header(text: "header text game 2", image_path: "http://localhost:5000/images/game2.jpg")
          not_in_response_item.build_content(main_text: "gangnams")

          index.content.items << updated_item
          index.content.items << not_in_response_item
          index.save!

          expect {
            Cms::SyncJob.perform
          }.to change(Cms::Page::Item, :count).by(1)
          updated_item.reload
          updated_item.name.should == "Superheroes 1"
          updated_item.header.text.should == "Superheroes 1"
          updated_item.header.image_path.should == SERVER + "images/game1.jpg"
          updated_item.content.main_text.should == "Superheroes is an amazing fight game"
        end
      end
    end
  end
end
