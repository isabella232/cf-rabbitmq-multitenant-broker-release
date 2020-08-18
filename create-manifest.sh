ENVIRONMENT=

bosh interpolate --var deployment-name=cf-rabbitmq-multitenant-broker-release-ci \
        --var-errs --ops-file=manifests/add-cf-rabbitmq.yml \
        --ops-file=manifests/change-vcap-password.yml \
        --ops-file=manifests/add-go-syslogd.yml \
        --ops-file=manifests/add-syslog.yml \
        --ops-file=manifests/add-bosh-dns-aliases.yml \
        --ops-file=../cf-rabbitmq-pipelines/manifests/ops-files/add-embedded-tests.yml \
        --vars-file=../cf-rabbitmq-pipelines/manifests/vars-files/cf-rabbitmq-vars.yml \
        --vars-file=../cf-rabbitmq-pipelines/manifests/vars-files/cf-rabbitmq-multitenant-broker-vars.yml \
        --vars-file=../cf-rabbitmq-pipelines/manifests/vars-files/smith-cf-deployment-vars.yml \
        --var cf-admin-password="((/bosh-${ENVIRONMENT}/cf/cf_admin_password))" \
        --var system-domain=example.com \
        --var stemcell-version=621.78 manifests/cf-rabbitmq-broker-template.yml > manifest.yml

