'use strict'

# Use local.env.js for environment variables that grunt will set when the server starts locally.
# Use for your api keys, secrets, etc. This file should not be tracked by git.
#
# You will need to set these on the server you deploy to.

module.exports =
  DOMAIN:           'http://localhost:9000'
  HOSTNAME:         'localhost'
  SESSION_SECRET:   'tildasite-secret'

  # Control debug level for modules using visionmedia/debug
  DEBUG: ''

  SSL_KEY: 'path-to-key'
  SSL_CERT: 'path-to-cert'

  # Tilda Access Credentials
  TILDA_PROJECT_ID: 'project-id'
  TILDA_PUBLIC_KEY: 'public-key'
  TILDA_SECRET_KEY: 'secret-key'
  TILDA_404: '404'

  # Redis URI
  REDIS_URI: 'redis://localhost:6379'

  # Facebook
  FACEBOOK_APP_ID: 'facebook-app-id'

  # Direct URL to Favicon
  FAVICON_URL: '//images.tildacdn.info/9ce081a1-8a77-44f5-997f-29a1a61b1037/favicon.ico'

  # Google Analytics ID
  GOOGLE_ANALYTICS_ID: 'google-analytics-id'

  # Amazon S3 and CloudFront
  AMAZON_API_KEY: 'key'
  AMAZON_API_SECRET: 'secret'
  AMAZON_BUCKET: 'bucket'
  AMAZON_REGION: 'us-east-1'
  AMAZON_CDN_DOMAIN: 'cdn-domain'