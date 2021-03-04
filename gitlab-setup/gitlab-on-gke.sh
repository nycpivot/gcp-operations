read "Domain (gcp.nycivot.com): " DOMAIN
read "Email: " EMAIL

kubectl config use-context gke_pa-mjames_us-east1_gitlab

helm repo add gitlab https://charts.gitlab.io/

helm install gitlab gitlab/gitlab \
  --set global.hosts.domain=$DOMAIN \
  --set certmanager-issuer.email=$EMAIL
  
kubectl get ingress -lrelease=gitlab

kubectl get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo