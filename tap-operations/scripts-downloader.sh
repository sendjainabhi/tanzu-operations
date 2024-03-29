rm -rf tap
mkdir tap

wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/01-bootstrapper-setup.sh -O tap/01-bootstrapper-setup.sh
wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/02-tap-operator-creator.sh -O tap/02-tap-operator-creator.sh

wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/10-pre-reqs.sh -O tap/10-pre-reqs.sh
wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/11-eks-setup-us-west-1.sh -O tap/11-eks-setup-us-west-1.sh
wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/12-pre-reqs-tanzu.sh -O tap/12-pre-reqs-tanzu.sh
wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/20-tap-packages.sh -O tap/20-tap-packages.sh
wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/21-tap-values-build.sh -O tap/21-tap-values-build.sh
wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/21-tap-values-full.sh -O tap/21-tap-values-full.sh
wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/21-tap-values-run.sh -O tap/21-tap-values-run.sh
wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/22-developer-namespace.sh -O tap/22-developer-namespace.sh
wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/23-tilt.sh -O tap/23-tilt.sh

wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/30-reset-rabbitmq-operator.sh -O tap/30-reset-rabbitmq-operator.sh
wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/31-deploy-rabbitmq-operator.sh -O tap/31-deploy-rabbitmq-operator.sh

wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/100-app-demo.sh -O tap/100-app-demo.sh
wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/101-app-service-demo.sh -O tap/101-app-service-demo.sh
wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/102-tilt-demo.sh -O tap/102-tilt-demo.sh

wget https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tap-operations/1000-delete-clusters.sh -O tap/1000-delete-clusters.sh
