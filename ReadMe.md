## Build and deployt Golang + HTMX application in Azure

Building a HTMX solution with Golang and GIN was much easier than I thought it would be. But putting all the pieces together is arranging a jigsaw puzzle without a blurptint. I'll attempt to make that part easier byt going one step at a time.

### What is HTMX

### Why GOlang + gin?

### What'd the difference betwwen tmepl vs HTMX

### Golang + gin - Web app

### Infrastructure setup in Azure

#### Powershell

- Create RG
- Create ACR instance
- Build local docker image
- Push your image to ACR
- Create container app and env

```
docker build -t acreusgoginhtmqcrvw.azurecr.io/go-htmsite:latest . --platform="linux/amd64"
docker run -d -p 8080:8080 acreusQCrvw.azurecr.io/go-htmsite
docker login -u acreusgoginhtmQCrvw -p U2RVFPLJWGNSqOAcsCR9kXGPNoGJtpGk/D09rMnfyv+ACRDazInm acreusgoginhtmqcrvw.azurecr.io
docker push acreusgoginhtmqcrvw.azurecr.io/go-htmsite:latest

az acr repository list --name acreusqcrvw.azurecr.io --output table

ACR_PASSWORD=$(az acr credential show --name acreusgoginhtmqcrvw.azurecr.io --query 'passwords[0].value' --out tsv)

az containerapp env create --name godemoAppDevEnv --resource-group rg-cus-sample --location "East US"
az containerapp create --name gohtmsitecontainer --resource-group rg-eus-goginhtm --environment caegoginhtmQCrvw --image "acreusgoginhtmqcrvw.azurecr.io/go-htmsite:latest" --registry-server "acreusgoginhtmqcrvw.azurecr.io" --registry-username "acreusgoginhtmqcrvw" --registry-password $ACR_PASSWORD --target-port 8080 --ingress "external"
```

#### Terraform way

- Spin up the infrastructure with deploy_container set to false
- Build your docker image locally, run it, test it
- Push intainer to ACR
- Re-execute terraform script with deploy_container set to true

### Enhancements

Print output of container URL post deployment through outputs.tf
