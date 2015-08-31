unless !!ENV["si"]
  if defined? RailsAdmin

    def model_defaults
      resource_class = self.abstract_model.model_name.constantize
      label do
        resource_class.human_class_name
      end

      label_plural do
        resource_class.human_class_name(multiple: true)
      end

      if (path = resource_class.name.split("::")).count == 2 && path[0] == 'Sigma'
        navigation_label false
      end
    end

    def apartment_navigation_label
      navigation_label do
        I18n.t("admin.navigation_labels.apartment")
      end
    end

    RailsAdmin.config do |config|

      ### Popular gems integration

      ## == Devise ==
      # config.authenticate_with do
      #   warden.authenticate! scope: :user
      # end
      # config.current_user_method(&:current_user)

      ## == Cancan ==
      config.authorize_with :cancan

      ## == PaperTrail ==
      # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

      ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

      config.actions do
        dashboard                     # mandatory
        #explorer
        #file_manager
        index                         # mandatory
        new
        export
        bulk_delete
        show
        edit
        delete
        show_in_app

        ## With an audit adapter, you can add:
        # history_index
        # history_show
      end

      config.excluded_models += ["Cms::HtmlBlock", "Cms::SitemapElement"]

      hidden_models = [Address, AdministrativeUserInfo, ApartmentTechnicalInfo, Asset, ClientInfo, HouseMainInfo, HouseTechnicalInfo, Infrastructure, Page, SeoTags]

      hidden_models.each do |m|
        config.model m do
          visible false
        end
      end

      config.model Apartment do
        visible false
        edit do
          group :main_info do
            field :apartment_house do
              @order = 200
            end
            field :apartment_number
            field :price
            field :square
            field :status
          end

          group :apartment_technical_info do
            field :apartment_technical_info
          end

          group :attachments do
            field :images, :images
          end
        end
      end

      config.model ApartmentTechnicalInfo do
        visible false
        nested do
          configure :actable_as_apartment, :hidden
        end
      end

      config.model BuildingComplex do
        visible false

        edit do
          field :name
          field :main_info
          field :technical_info
          field :infrastructure
          field :total_square
        end
      end

      config.model ApartmentHouse do
        visible false
        field :builder_complex
        field :status
      end

      config.model HouseMainInfo do
        visible false
        nested do
          field :house_class
          #field :address
          #field :status
          field :availability
          field :start_date
          field :end_date
          field :price_from
          field :builder_site
          field :phone
        end
      end

      config.model HouseTechnicalInfo do
        visible false
        nested do
          field :sections_count
          field :building_type
          field :earth_area_square
          field :operated_roof
        end
      end

      config.model Infrastructure do
        visible false
        nested do
          field :distance_to_pre_school
          field :distance_to_school
          field :nearest_metro_station
          field :nearest_bus_stop
          field :distance_to_food_markets
          field :playground
        end
      end

      config.model ApartmentHouse do

      end

      config.model Asset do
        nested do
          configure :assetable do
            hide
          end

          configure :assetable_field_name do
            hide
          end
        end
      end

      config.model Sigma::ApartmentTechnicalSettings do
        visible false

        nested do
          configure :building do
            hide
          end
        end
      end

      config.model Sigma::HouseTechnicalSettings do
        visible false

        nested do
          configure :building do
            hide
          end
        end
      end

      config.model Sigma::BuildingComplex do |m|
        model_defaults
        apartment_navigation_label

        edit do
          configure :apartments do
            hide
          end
        end

        list do
          field :name
          field :city
          field :complex_class
          field :price_from
          field :apartment_houses_count, :integer do |*args|

          end
          field :status
        end
      end

      config.model Sigma::ApartmentHouse do |m|
        model_defaults
        weight 1
        apartment_navigation_label
      end

      config.model Sigma::Apartment do |m|
        model_defaults
        weight 1
        apartment_navigation_label

      end
    end
  end
end