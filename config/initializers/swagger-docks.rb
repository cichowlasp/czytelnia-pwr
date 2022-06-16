# config/initializers/swagger-docs.rb
Swagger::Docs::Config.register_apis({
    "1.0" => {
      :api_file_path => "public/",
      :base_path => "http://127.0.0.1:3000",
      :clean_directory => true,
      :attributes => {
        :info => {
          "title" => "Library app",
          "description" => "Example rails app"
        }
      }
    }
  })