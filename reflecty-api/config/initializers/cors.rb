Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins "http://localhost:3000" # 将来のフロントエンドのURL
    origins "*" # in development

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ['Authorization'] # JWT用
  end
end
