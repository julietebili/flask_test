# Import OS for docker [cached]
FROM node:16.14.0-alpine

# # Install pm2 globally [cached]
RUN npm install pm2 -g

# Install python on node image [Cached]
RUN apk add --update --no-cache python3 py3-pip

# # Create a working directory called "app" [cached]
WORKDIR /app

# Setup environment variables using the flask command [cached]
# ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# COPY requirements.txt from the project root folder to the "app" working directory [cached]
COPY requirements.txt .

# Install the necessary dependencies [cached]
RUN pip3 install -r requirements.txt

# Copy the current directory in the project to the workdir in the image
COPY . .

# Expose the port the application will use in the container
EXPOSE 5000

ARG PM2_PUBLIC_KEY
ARG PM2_SECRET_KEY
ARG PM2_MACHINE_NAME

ENV PM2_PUBLIC_KEY ${PM2_PUBLIC_KEY}
ENV PM2_SECRET_KEY ${PM2_SECRET_KEY}
ENV PM2_MACHINE_NAME ${PM2_MACHINE_NAME}

# # Command to run the application in the container
CMD ["pm2-runtime", "app.py"]