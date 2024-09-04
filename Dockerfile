# Use an official Python runtime as a parent image
FROM nvidia/cuda:12.1.0-cudnn8-devel-ubuntu20.04

# Set the working directory in the container
WORKDIR /workspace

# Install git so we can clone the GitHub repository
RUN apt-get update && apt-get install -y git

# Install Python pip
RUN set -xe \
    && apt-get update -y \
    && apt-get install -y python3-pip

# Install dependencies
RUN pip install --no-cache-dir -r requirements_test.txt

# Expose port 8888 for Jupyter
EXPOSE 8888

# Install Jupyter Notebook and other dependencies
RUN pip install jupyter

# Start the Jupyter Notebook server
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
