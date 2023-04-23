FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /usr/src/app

# add project files
COPY OLab45-Api Api
COPY OLab45-Common Common

# build folder
RUN mkdir -p /opt/olab46/api

# strip systemd service from build - we don't use that for the container, hence would throw errors
RUN grep -vE 'service\s{1,}olab46api' < Api/build.sh > Api/build-alt.sh

# settings file
COPY appsettings.json Api/WebApiService/

# build api service
RUN cd Api && /bin/bash build-alt.sh

# delete temporary files
RUN rm -f build-alt.sh

# expose http port
EXPOSE 80/tcp

# entrypoint file
COPY entrypoint.sh .

# start api server
ENTRYPOINT /bin/bash entrypoint.sh
