# Use the official Microsoft .NET SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:7.0

RUN mkdir -p /opt/cs
COPY . /opt/cs
WORKDIR /opt/cs/api
CMD [ "dotnet", "watch", "run" ]
