Rails.application.routes.draw do
  resources(:movies) do
    collection do
      post(:search)
    end
  end

  resources(:countries) do
    collection do
      post(:search)
    end
  end

  root("countries#index")
end
