ActiveAdmin.register Gym do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
    permit_params :name, :title, :content, :number, :address, :price, :image, :district_id, :latitude, :longitude, gym_categories_attributes: [:category_id, :_destroy, :id],
                  gym_trainers_attributes: [:trainer_id, :_destroy, :id]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :title, :content, :number, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  form do |f|
    f.inputs "Gyms" do
      f.input :name
      f.input :title
      f.input :content
      f.input :number
      f.input :address
      f.input :price
      f.input :image, :as => :file
      f.input :district_id, label: 'エリア', as: :select, collection: District.all.map{|a| [a.name, a.id]}
      f.has_many :gym_categories, allow_destroy: true, heading: false,
                                  new_record: true do |k|
        k.input :category_id,
                label: 'カテゴリー', as: :select, collection: Category.all.map{|a| [a.name, a.id]}
      end
      f.has_many :gym_trainers, allow_destroy: true, heading: false,
                                  new_record: true do |t|
        t.input :trainer_id,
                label: 'トレーナー', as: :select, collection: Trainer.all.map{|a| [a.name, a.id]}
      end
      f.actions
    end
  end
end