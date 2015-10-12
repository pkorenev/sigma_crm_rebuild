unless !!ENV["si"]
  if defined? RailsAdmin

    require "rails_admin_extensions"

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

    def group_with_i18n_label label, &block
      group I18n.t("admin.field_group_labels.#{label}"), &block
    end

    def i18n_navigation_label(label)
      navigation_label do
        I18n.t("admin.navigation_labels.#{label}")
      end
    end

    RailsAdmin.config do |config|

      ### Popular gems integration

      # == Devise ==
      config.authenticate_with do
        warden.authenticate! scope: :user
      end
      config.current_user_method(&:current_user)

      ## == Cancan ==
      config.authorize_with :cancan

      ## == PaperTrail ==
      # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

      ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

      config.actions do
        dashboard                     # mandatory
        #explorer
        #file_manager
        index do
          # mandatory
          # controller do
          #   proc do
          #     render inline: @model_name #instance_variables.inspect
          #   end
          # end
          # template_name do
          #   # if @model_name == "Sigma::Manager"
          #   #   "custom_index"
          #   # end
          #
          # end
        end
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
        if respond_to?(:invite)
          invite do
            only [Sigma::Manager, Sigma::Client]
          end
        end
      end



      hidden_models = []

      hidden_models.each do |m|
        config.model m do
          visible false
        end
      end

      config.included_models += [Sigma::ClientInfo]


      Attachable::Asset.configure_rails_admin(config)


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

        show do
          field :name
          field :complex_class
          field :country
          field :city
          field :district
          field :street
          field :street_number
          field :status
          field :apartments
          field :banner_images
          field :apartment_1_rooms_count do
            read_only true
          end
          field :apartment_2_rooms_count do
            read_only true
          end
          field :apartment_3_rooms_count do
            read_only true
          end
          field :apartment_4_rooms_count do
            read_only true
          end
          field :apartment_5_plus_rooms_count do
            read_only true
          end

          field :insulation_type_and_material
          field :internal_finishing_work_in_accommodations
          field :internal_finishing_work_in_residential_premises
          field :internal_finishing_work_in_common_use_premises
        end

        edit do
          configure :apartments do
            hide
          end

          group_with_i18n_label :main_info do
            field :name
            field :complex_class
            field :status
            field :country
            field :city
            field :district
            field :street
            field :street_number
            field :coordinates
            field :availability
            field :building_start_date do
              date_format do
                "year_month"
              end
            end
            field :building_end_date do
              date_format do
                "year_month"
              end
            end
            field :price_from
            field :builder do
              help "Виберіть зі списку або додайте новий"
            end
            field :complex_url
            field :phone

            field :apartment_houses_count do
              read_only true
            end
          end


          group_with_i18n_label :infrastructure do
            field :distance_to_pre_school
            field :distance_to_school
            field :distance_to_food_markets
            field :playground
            field :nearest_metro_station
            field :nearest_bus_stop
          end

          group_with_i18n_label :technical_details do
            field :earth_area_square
            field :total_complex_square
            field :total_live_square
            field :total_accommodations_count
            field :accomodation_commercial_square
            field :commerce_square_of_residential_premises
            field :insulation_type_and_material
            field :internal_finishing_work_in_accommodations
            field :internal_finishing_work_in_residential_premises
            field :internal_finishing_work_in_common_use_premises

            field :apartment_1_rooms_count
            field :apartment_2_rooms_count
            field :apartment_3_rooms_count
            field :apartment_4_rooms_count
            field :apartment_5_plus_rooms_count

          end

          group_with_i18n_label :defaults do
            field :apartment_house_defaults
            field :apartment_defaults
          end

          group :content do
            field :banner_images
            field :gallery_images
            field :short_description
            field :main_description_html, :ck_editor
            field :infrastructure_description_html, :ck_editor
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

        show do
          field :building_complex
          field :coordinates
          field :street
          field :street_number
          field :status
          field :building_start_date
          field :building_end_date
          field :price_from
          field :levels_count
          field :apartments
          field :apartment_1_rooms_count
          field :apartment_2_rooms_count
          field :apartment_3_rooms_count
          field :apartment_4_rooms_count
          field :apartment_5_plus_rooms_count
        end

        edit do
          field :published
          field :building_complex
          field :coordinates
          field :street
          field :street_number
          field :status
          field :building_start_date
          field :building_end_date
          field :price_from
          field :levels_count
          field :apartments_count
          field :apartment_defaults
          field :technical_settings
          field :apartments

          field :apartment_1_rooms_count do
            read_only true
          end
          field :apartment_2_rooms_count do
            read_only true
          end
          field :apartment_3_rooms_count do
            read_only true
          end
          field :apartment_4_rooms_count do
            read_only true
          end
          field :apartment_5_plus_rooms_count do
            read_only true
          end
        end
      end

      config.model Sigma::Apartment do |m|
        model_defaults
        weight 1
        apartment_navigation_label

        show do

        end

        edit do
          field :published
          field :best
          field :building_complex
          field :apartment_house
          field :apartment_number
          field :status
          field :price
          field :building_premise_number
          field :world_sides
          field :apartment_type
          field :total_square
          field :live_square
          field :kitchen_square
          field :turnkey
          field :rooms_count
          field :level
          field :main_description_html, :ck_editor
          field :infrastructure_description_html, :ck_editor
          field :technical_settings
          field :banner_images
          field :gallery_images
          field :pdf_file
        end

      end

      config.model User do
        visible false
      end

      config.model Sigma::Administrator do
        visible false
        #visible false
        parent false
        navigation_label do
          I18n.t("admin.navigation_labels.workers")
        end
      end

      config.model Sigma::Manager do
        navigation_label do
          I18n.t("admin.navigation_labels.workers")
        end

        if respond_to?(:invite)
          invite do
           field :email
          end
        end

        # create do
        #   field :email
        # end

        list do
          field :avatar
          field :email
          field :first_name
          field :last_name
          field :role
          field :phone_number


        end

        show do
          field :avatar do
            thumb_method :large
          end

          field :full_name
          field :email
          field :role, :enum do

          end

          group_with_i18n_label :user_info do
            field :company_name
            field :company_site
            field :phone_number
          end
        end
        edit do
          field :email
          field :first_name
          field :middle_name
          field :last_name
          field :avatar
          field :phone_number
          field :role, :enum do

            label do
              profile = @object.class == bindings[:view]._current_user.class &&  @object.id == bindings[:view]._current_user.id
              if true
                'Роль'
              else
                false
              end
            end
            help false
            render do
              profile = @object.class == bindings[:view]._current_user.class &&  @object.id == bindings[:view]._current_user.id

              if false
                bindings[:view].render :partial => "rails_admin/main/#{partial}", :locals => {:field => self, :form => bindings[:form] }
              else
                bindings[:view]._current_user.role
              end
            end
          end
          field :password
          field :password_confirmation
          group_with_i18n_label :user_info do
            field :company_name
            field :company_site

          end
        end
      end

      config.model Sigma::Client do
        i18n_navigation_label :clients

        show do




          field :avatar do
            thumb_method :large
          end

          field :full_name
          field :email
          field :client_types

          group_with_i18n_label :user_info do
            field :company_name
            field :company_site
            field :phone_number
          end
        end

        list do
          field :avatar
          field :email
          field :first_name
          field :last_name

          field :phone_number
        end

        edit do

          field :email

          field :first_name
          field :middle_name
          field :last_name
          field :avatar
          field :phone_number
          field :client_types
          field :password
          field :password_confirmation
          group_with_i18n_label :user_info do
            field :how_you_had_known
            field :birthday
            field :identification_number
            field :passport_serial_number
            field :passport_date
            field :passport_given_by

          end


          field :manager_id, :hidden do
            visible true
            def value
              bindings[:view]._current_user.id
            end
          end

          field :manager do
            visible do
              bindings[:view]._current_user.administrator? || bindings[:view]._current_user.super_administrator?
            end
          end


          #field :client_info


        end

      end

      config.model Sigma::Agreement do
        visible false
        #searchable :manager
        list do
          #filters [:manager]
          scopes [:laid, :unlaid]
        end
      end

      config.model Article do
        visible false
      end

      config.model Ckeditor::Asset do
        visible false
      end

      config.model Ckeditor::Picture do
        visible false
      end

      config.model Ckeditor::AttachmentFile do
        visible false
      end

      config.model Permission do
        visible false
      end

      config.model UserGroup do
        visible false
        field :name
        field :users
        field :permissions do
          partial do
            "form_user_permissions"
          end
        end
      end

      config.model Sigma::Builder do
        apartment_navigation_label
      end

      config.model UserMembership do
        visible false
      end



      config.model ClientType do
        i18n_navigation_label :clients
        edit do
          field :name
          field :description do
            help "Обов’язкове. Опишіть ознаки, за якими клієнта слід віднести до цієї групи"
          end
        end
      end

      config.model Sigma::SuperAdministrator do
        parent false
        i18n_navigation_label(:workers)
        visible false
      end

    end
  end
end