# YAML configuration, appengine-web.xml and web.xml will be automatically derived from app.yaml.
# http://code.google.com/intl/en/appengine/docs/java/configyaml/appconfig_yaml.html

application: crying-banksy
version: 1
runtime: java

precompilation_enabled: true
threadsafe: true


public_root: /pub

static_files:
  - include: /*
  - include: /pub/**
  - include: /errors/*
  - exclude: README.md
  - exclude: launch-local.cmd
  - exclude: /.stuff/**

resource_files:
  - exclude: README.md
  - exclude: launch-local.cmd
  - exclude: /.stuff/**

welcome_files:
  - index.html


# Sessions.
sessions_enabled: true


# Configure java.util.logging.
system_properties:
  java.util.logging.config.file: WEB-INF/logging.properties


# Warmup requests, xmpp, mail.
inbound_services:
  - warmup


# Handlers section.
# optlevel: -1 for run Rhino in interpreted mode
# (faster spin-up, reduced memory usage, slower at runtime).
# Modules and packages should be placed in ringo-home.
handlers:
  - url: /*
    servlet: org.ringojs.jsgi.JsgiServlet
    name: CryingBanksy
    init_params:
      ringo-home: /
      module-path: app
# devel:
      app: app
      optlevel: -1
# production:
#      app: production
#      production: true
#      optlevel: 9


# Static pages for critical error handling.
# Warning!: Make sure that the path to the error response file
#           does not overlap with static file handler paths.
error_handlers:
  - file: /errors/default.html

  - error_code: over_quota
    file: /errors/overquota.html

  - error_code: dos_api_denial
    file: /errors/dosdenial.html

  - error_code: timeout
    file: /errors/timeout.html


# Additional web.xml configuration lines.
web_xml: |
  <mime-mapping>
    <extension>ico</extension>
    <mime-type>image/x-icon</mime-type>
  </mime-mapping>
#  <error-page>
#    <error-code>500</error-code>
#    <location>/errors/servererror.jsp</location>
#  </error-page>