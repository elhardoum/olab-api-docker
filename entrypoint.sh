#!/usr/bin/env bash

case $(printf "${ASPNETCORE_ENVIRONMENT}" |awk '{print tolower($0)}') in
   "development") {
        cd Api/WebApiService && dotnet watch run \
          --project OLabWebAPI.csproj \
          --no-launch-profile \
          --urls http://*:80
    };;
   *) cd /opt/olab46/api/Release/net6.0 && ./OLabWebAPI --urls http://*:80;;
esac
