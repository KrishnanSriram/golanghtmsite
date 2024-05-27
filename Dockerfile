# Use the official Golang image
FROM golang:1.22-alpine

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY . .

# Install Gin
RUN go mod download

# Build the Go app
RUN CGO_ENABLED=0 go build -o main .

# Expose port 80 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./main"]