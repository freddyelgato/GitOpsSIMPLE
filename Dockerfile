# We use the Go base image with Alpine (a lightweight Linux version)
FROM golang:alpine

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the go.mod and go.sum files into the container (necessary for dependency management)
COPY go.* ./

# Download Go module dependencies defined in go.mod
RUN go mod download

# Copy the rest of the project files into the container
COPY . .

# Build the Go application, creating an executable file named 'main'
RUN go build -o main main.go

# Expose port 8080 so the container can accept connections on this port
EXPOSE 8080


CMD [ "./main" ]