ActiveAdmin.register Author do
  permit_params :first_name, :last_name, book_ids: []
  
end
