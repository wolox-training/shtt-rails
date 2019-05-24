# -----------------------------------------
# Uncomment and set for use custom options.
# -----------------------------------------
Rails.application.configure do
  # # Save DB Runtime?: Default: true
  # config.x.wprof.db_runtime = true
  # # Reporter Type (¿When we will save our data?): 'LOGGER' by default.
  # # Another options: 'FILE' (For CSV), 'DATABASE' (For Rails DB), 'EXTERNAL' (For external API).
  config.x.wprof.reporter_type = 'DATABASE'
  # # CSV Type (One CSV file for each type of data or all together)
  # # 'SPLIT' by default, Options: 'MIX'
  # config.x.wprof.csv_type = 'SPLIT'
  # # Reporter must be work async? Default: false
  # config.x.wprof.async = false
  # # Httparty Methods to wrapper.
  # config.x.wprof.httparty_methods_to_trace = %w[get put delete post]
  # # External URL for hit when Reporter Type is EXTERNAL
  # # DEFAULT: nil
  # config.x.wprof.external_url = 'http://localhost:3001/reports'
  # # Define Headers for Reporter Type when is EXTERNAL.
  # # Must be a Hash (see HTTPARTY doc for more info)
  # # DEFAULT: nil
  # config.x.wprof.external_headers = { headers: { 'User-Agent' => 'Httparty' } }
  # # Define your Custom Methods here! (Must be an Array)
  # config.x.wprof.custom_methods = [ 'my_great_method' ]
  # # Define your own path for save Files when Reporter Type is FILE
  # # By default Wor-Prof use Rails.root
  config.x.wprof.file_path = '/Users/samirhernandotapierotovar/wor-prof-test'
end
