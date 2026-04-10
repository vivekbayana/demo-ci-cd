# demo-ci-cd

This repository contains a sample .NET web application, Docker build configuration, Helm chart packaging, and a GitHub Actions CI pipeline.

## What is included

- `src/DemoApp/` - a minimal ASP.NET Core web API project
- `tests/DemoApp.Tests/` - a basic xUnit test project
- `Dockerfile` - builds and publishes the app into a container image
- `charts/demo-app/` - Helm chart for deploying the application
- `.github/workflows/ci.yml` - CI pipeline for build, test, Docker image build, and Helm packaging

## Build locally

```bash
dotnet restore src/DemoApp/DemoApp.csproj
dotnet build src/DemoApp/DemoApp.csproj --configuration Release
```

## Run tests

```bash
dotnet test tests/DemoApp.Tests/DemoApp.Tests.csproj --configuration Release
```

## Build Docker image

```bash
docker build -t demo-app:latest .
```

## Create Helm package

```bash
helm package charts/demo-app --destination charts/packages
```
