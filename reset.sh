#CREATE GKE CLUSTER
gcloud auth login

gcloud config set project pa-mjames
gcloud container clusters delete "gitlab" --region "us-east1"