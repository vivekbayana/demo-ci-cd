FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY src/DemoApp/DemoApp.csproj ./DemoApp/
RUN dotnet restore DemoApp/DemoApp.csproj

COPY src/DemoApp/. ./DemoApp/
WORKDIR /src/DemoApp
RUN dotnet publish DemoApp.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "DemoApp.dll"]
