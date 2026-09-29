import Config

if Mix.env() != :test and File.exists?(".env") do
  ".env"
  |> File.read!()
  |> String.split("\n", trim: true)
  |> Enum.reject(&(String.starts_with?(&1, "#") or &1 == ""))
  |> Enum.each(fn line ->
    case String.split(line, "=", parts: 2) do
      [key, val] ->
        key = String.trim(key)
        val = val |> String.trim() |> String.trim("\"")
        System.put_env(key, val)

      _ ->
        :ok
    end
  end)
end

config :amur,
  base_url: System.get_env("BASE_URL", "https://localhost:4000"),
  providers: [
    apple: [
      client_id: System.fetch_env!("APPLE_CLIENT_ID"),
      client_secret: System.fetch_env!("APPLE_CLIENT_SECRET")
    ],
    auth0: [
      base_url: System.fetch_env!("AUTH0_BASE_URL"),
      client_id: System.fetch_env!("AUTH0_CLIENT_ID"),
      client_secret: System.fetch_env!("AUTH0_CLIENT_SECRET")
    ],
    authentik: [
      base_url: System.fetch_env!("AUTHENTIK_BASE_URL"),
      client_id: System.fetch_env!("AUTHENTIK_CLIENT_ID"),
      client_secret: System.fetch_env!("AUTHENTIK_CLIENT_SECRET")
    ],
    aws_cognito: [
      base_url: System.fetch_env!("AWS_COGNITO_BASE_URL"),
      client_id: System.fetch_env!("AWS_COGNITO_CLIENT_ID"),
      client_secret: System.fetch_env!("AWS_COGNITO_CLIENT_SECRET")
    ],
    azure_ad: [
      client_id: System.fetch_env!("AZURE_AD_CLIENT_ID"),
      client_secret: System.fetch_env!("AZURE_AD_CLIENT_SECRET")
    ],
    basecamp: [
      client_id: System.fetch_env!("BASECAMP_CLIENT_ID"),
      client_secret: System.fetch_env!("BASECAMP_CLIENT_SECRET")
    ],
    bitbucket: [
      client_id: System.fetch_env!("BITBUCKET_CLIENT_ID"),
      client_secret: System.fetch_env!("BITBUCKET_CLIENT_SECRET")
    ],
    digital_ocean: [
      client_id: System.fetch_env!("DIGITAL_OCEAN_CLIENT_ID"),
      client_secret: System.fetch_env!("DIGITAL_OCEAN_CLIENT_SECRET")
    ],
    discord: [
      client_id: System.fetch_env!("DISCORD_CLIENT_ID"),
      client_secret: System.fetch_env!("DISCORD_CLIENT_SECRET")
    ],
    facebook: [
      client_id: System.fetch_env!("FACEBOOK_CLIENT_ID"),
      client_secret: System.fetch_env!("FACEBOOK_CLIENT_SECRET")
    ],
    github: [
      client_id: System.fetch_env!("GITHUB_CLIENT_ID"),
      client_secret: System.fetch_env!("GITHUB_CLIENT_SECRET")
    ],
    gitlab: [
      client_id: System.fetch_env!("GITLAB_CLIENT_ID"),
      client_secret: System.fetch_env!("GITLAB_CLIENT_SECRET")
    ],
    google: [
      client_id: System.fetch_env!("GOOGLE_CLIENT_ID"),
      client_secret: System.fetch_env!("GOOGLE_CLIENT_SECRET")
    ],
    hackclub: [
      client_id: System.fetch_env!("HACKCLUB_CLIENT_ID"),
      client_secret: System.fetch_env!("HACKCLUB_CLIENT_SECRET")
    ],
    instagram: [
      client_id: System.fetch_env!("INSTAGRAM_CLIENT_ID"),
      client_secret: System.fetch_env!("INSTAGRAM_CLIENT_SECRET")
    ],
    keycloak: [
      base_url: System.fetch_env!("KEYCLOAK_BASE_URL"),
      client_id: System.fetch_env!("KEYCLOAK_CLIENT_ID"),
      client_secret: System.fetch_env!("KEYCLOAK_CLIENT_SECRET")
    ],
    line: [
      client_id: System.fetch_env!("LINE_CLIENT_ID"),
      client_secret: System.fetch_env!("LINE_CLIENT_SECRET")
    ],
    linkedin: [
      client_id: System.fetch_env!("LINKEDIN_CLIENT_ID"),
      client_secret: System.fetch_env!("LINKEDIN_CLIENT_SECRET")
    ],
    okta: [
      base_url: System.fetch_env!("OKTA_BASE_URL"),
      client_id: System.fetch_env!("OKTA_CLIENT_ID"),
      client_secret: System.fetch_env!("OKTA_CLIENT_SECRET")
    ],
    patreon: [
      client_id: System.fetch_env!("PATREON_CLIENT_ID"),
      client_secret: System.fetch_env!("PATREON_CLIENT_SECRET")
    ],
    reddit: [
      client_id: System.fetch_env!("REDDIT_CLIENT_ID"),
      client_secret: System.fetch_env!("REDDIT_CLIENT_SECRET")
    ],
    salesforce: [
      client_id: System.fetch_env!("SALESFORCE_CLIENT_ID"),
      client_secret: System.fetch_env!("SALESFORCE_CLIENT_SECRET")
    ],
    shopify: [
      base_url: System.fetch_env!("SHOPIFY_BASE_URL"),
      client_id: System.fetch_env!("SHOPIFY_CLIENT_ID"),
      client_secret: System.fetch_env!("SHOPIFY_CLIENT_SECRET")
    ],
    slack: [
      client_id: System.fetch_env!("SLACK_CLIENT_ID"),
      client_secret: System.fetch_env!("SLACK_CLIENT_SECRET")
    ],
    spotify: [
      client_id: System.fetch_env!("SPOTIFY_CLIENT_ID"),
      client_secret: System.fetch_env!("SPOTIFY_CLIENT_SECRET")
    ],
    strava: [
      client_id: System.fetch_env!("STRAVA_CLIENT_ID"),
      client_secret: System.fetch_env!("STRAVA_CLIENT_SECRET")
    ],
    stripe: [
      client_id: System.fetch_env!("STRIPE_CLIENT_ID"),
      client_secret: System.fetch_env!("STRIPE_CLIENT_SECRET")
    ],
    telegram: [
      client_id: System.fetch_env!("TELEGRAM_CLIENT_ID"),
      client_secret: System.fetch_env!("TELEGRAM_CLIENT_SECRET")
    ],
    twitch: [
      client_id: System.fetch_env!("TWITCH_CLIENT_ID"),
      client_secret: System.fetch_env!("TWITCH_CLIENT_SECRET")
    ],
    twitter: [
      client_id: System.fetch_env!("TWITTER_CLIENT_ID"),
      client_secret: System.fetch_env!("TWITTER_CLIENT_SECRET")
    ],
    vk: [
      client_id: System.fetch_env!("VK_CLIENT_ID"),
      client_secret: System.fetch_env!("VK_CLIENT_SECRET")
    ],
    zitadel: [
      base_url: System.fetch_env!("ZITADEL_BASE_URL"),
      client_id: System.fetch_env!("ZITADEL_CLIENT_ID"),
      client_secret: System.fetch_env!("ZITADEL_CLIENT_SECRET")
    ]
  ],
  on_success: &AmurTest1Web.AuthController.on_success/2,
  on_failure: &AmurTest1Web.AuthController.on_failure/2

# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it is typically used to load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.
# The block below contains prod specific runtime configuration.

# ## Using releases
#
# If you use `mix release`, you need to explicitly enable the server
# by passing the PHX_SERVER=true when you start it:
#
#     PHX_SERVER=true bin/amur_test1 start
#
# Alternatively, you can use `mix phx.gen.release` to generate a `bin/server`
# script that automatically sets the env var above.
if System.get_env("PHX_SERVER") do
  config :amur_test1, AmurTest1Web.Endpoint, server: true
end

config :amur_test1, AmurTest1Web.Endpoint,
  http: [port: String.to_integer(System.get_env("PORT", "4000"))]

if config_env() == :dev do
  # Reload browser tabs when matching files change.
  config :amur_test1, AmurTest1Web.Endpoint,
    live_reload: [
      web_console_logger: true,
      patterns: [
        # Static assets, except user uploads
        ~r"priv/static/(?!uploads/).*\.(js|css|png|jpeg|jpg|gif|svg)$"E,
        # Gettext translations
        ~r"priv/gettext/.*\.po$"E,
        # Router, Controllers, LiveViews and LiveComponents
        ~r"lib/amur_test1_web/router\.ex$"E,
        ~r"lib/amur_test1_web/(controllers|live|components)/.*\.(ex|heex)$"E
      ]
    ]
end

if config_env() == :prod do
  # The secret key base is used to sign/encrypt cookies and other secrets.
  # A default value is used in config/dev.exs and config/test.exs but you
  # want to use a different value for prod and you most likely don't want
  # to check this value into version control, so we use an environment
  # variable instead.
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  host = System.get_env("PHX_HOST") || "example.com"

  config :amur_test1, :dns_cluster_query, System.get_env("DNS_CLUSTER_QUERY")

  config :amur_test1, AmurTest1Web.Endpoint,
    url: [host: host, port: 443, scheme: "https"],
    http: [
      # Enable IPv6 and bind on all interfaces.
      # Set it to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.
      # See the documentation on https://bandit.hexdocs.pm/Bandit.html#t:options/0
      # for details about using IPv6 vs IPv4 and loopback vs public addresses.
      ip: {0, 0, 0, 0, 0, 0, 0, 0}
    ],
    secret_key_base: secret_key_base

  # ## SSL Support
  #
  # To get SSL working, you will need to add the `https` key
  # to your endpoint configuration:
  #
  #     config :amur_test1, AmurTest1Web.Endpoint,
  #       https: [
  #         ...,
  #         port: 443,
  #         cipher_suite: :strong,
  #         keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
  #         certfile: System.get_env("SOME_APP_SSL_CERT_PATH")
  #       ]
  #
  # The `cipher_suite` is set to `:strong` to support only the
  # latest and more secure SSL ciphers. This means old browsers
  # and clients may not be supported. You can set it to
  # `:compatible` for wider support.
  #
  # `:keyfile` and `:certfile` expect an absolute path to the key
  # and cert in disk or a relative path inside priv, for example
  # "priv/ssl/server.key". For all supported SSL configuration
  # options, see https://plug.hexdocs.pm/Plug.SSL.html#configure/1
  #
  # We also recommend setting `force_ssl` in your config/prod.exs,
  # ensuring no data is ever sent via http, always redirecting to https:
  #
  #     config :amur_test1, AmurTest1Web.Endpoint,
  #       force_ssl: [hsts: true]
  #
  # Check `Plug.SSL` for all available options in `force_ssl`.

  # ## Configuring the mailer
  #
  # In production you need to configure the mailer to use a different adapter.
  # Here is an example configuration for Mailgun:
  #
  #     config :amur_test1, AmurTest1.Mailer,
  #       adapter: Swoosh.Adapters.Mailgun,
  #       api_key: System.get_env("MAILGUN_API_KEY"),
  #       domain: System.get_env("MAILGUN_DOMAIN")
  #
  # Most non-SMTP adapters require an API client. Swoosh supports Req, Hackney,
  # and Finch out-of-the-box. This configuration is typically done at
  # compile-time in your config/prod.exs:
  #
  #     config :swoosh, :api_client, Swoosh.ApiClient.Req
  #
  # See https://swoosh.hexdocs.pm/Swoosh.html#module-installation for details.
end
