## Build and deployt Golang + HTMX application in Azure

Building a HTMX solution with Golang and GIN was much easier than I thought it would be. But putting all the pieces together is arranging a jigsaw puzzle without a blurptint. I'll attempt to make that part easier byt going one step at a time.

### What/Why HTMX?

HTMX is a small library that lets you add special powers to your regular HTML. With HTMX, you can do things like:

- Update parts of a webpage without reloading the whole thing (like refreshing a comment section).
- Submit forms and handle responses without writing Javascript.
- React to events on the server-side, like new messages coming in.

Although HTMX abstracts JS, it does not mean there's no JS involved. There's JS behind the scenes.

### Why Golang + gin?

Go and HTMX are a great pairing for web development because they share some key philosophies and offer complementary strengths:

#### Simpler and More Efficient Development

Reduced Javascript Reliance: HTMX minimizes complex Javascript, and Go is known for its clean and efficient code. This leads to faster development and easier maintenance.
Focus on Server-Side: Both Go and HTMX prioritize server-side functionality. Go excels at building backend services, while HTMX pushes logic back to the server, reducing frontend complexity.

#### Improved Performance and Scalability

- Go's Concurrency: Go's concurrency model allows it to handle many connections efficiently, perfect for HTMX's focus on server-side updates. This translates to a smooth user experience even with high traffic.
- Focus on Core Functionality: Both Go and HTMX avoid unnecessary overhead. Go is known for its compiled nature and focus on performance, while HTMX is a lightweight library. This combination keeps your application fast and scalable.

#### Developer Experience

- Readability and Maintainability: Go code is known for being clear and concise. When combined with HTMX's focus on HTML attributes, the overall codebase becomes easier to understand and maintain for both backend and frontend developers.

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
