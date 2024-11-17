# Stage 1: Build the Go application
FROM golang:1.23 AS builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files to the workspace
COPY go.mod go.sum ./

# Download all dependencies. This step is cached unless go.mod or go.sum changes
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the application
RUN go build -o main .

# Stage 2: Create a minimal final image
FROM alpine:latest

# Install necessary CA certificates for HTTPS
RUN apk --no-cache add ca-certificates

# Set the Current Working Directory inside the container
WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/main .

# Expose the port the app runs on
EXPOSE 8080

# Command to run the executable
CMD ["./main"]
