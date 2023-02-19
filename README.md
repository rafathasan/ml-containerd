
# ML-Containerd

ML-Containerd is a Dockerized environment that provides a complete setup for Machine Learning development, including PyTorch with CUDA, Jupyter, Code-Server, and TensorBoard. The images provided in this repository can be used to quickly and easily set up a local development environment for ML projects.

## Installation

To install and use ML-Containerd, follow these steps:

1.  Clone this repository to your local machine.
    
2.  Ensure that you have Docker installed and running on your machine.
    
3.  Navigate to the repository directory and modify the environment variables in the following files:
    
    -   `dev.env`: Use this file to set environment variables for the `dev` service.
    -   `prod.env`: Use this file to set environment variables for the `prod` service.
    -   `.env`: Use this file to set environment variables for Docker Compose. Note: In `dev.env`, change the `PASSWORD=password` entry to a strong, secure password to use for Code-Server.
4.  Run the following command to start the environment: `docker-compose up <service_name>`, where `<service_name>` is one of `dev`, `prod`, or `monitor`.
    

## Services

The ML-Containerd environment consists of the following services:

-   `dev`: a development environment with Jupyter and Code-Server, intended for interactive development and experimentation. Use `dev.env` to set environment variables for this service.
-   `prod`: a production environment with PyTorch and CUDA enabled, intended for running and testing models in a production-like environment. Use `prod.env` to set environment variables for this service.
-   `monitor`: a TensorBoard instance that can be used to monitor training and view model statistics.

## Usage

To use the services provided by ML-Containerd, follow these steps:

1.  Start the environment using the `docker-compose up <service_name>` command as described above.
2.  Navigate to the appropriate service in your web browser. The URLs for each service are as follows:
    -   `dev`: [http://localhost:8888](http://localhost:8888/) or [http://localhost:8080](http://localhost:8080/) (for Code-Server)
    -   `prod`: This service is intended to be used programmatically, rather than through a web interface.
    -   `monitor`: [http://localhost:6006](http://localhost:6006/)
3.  Use the service as desired for your ML development or production tasks.

## Contributing

If you find a bug or have a suggestion for improvement, please submit an issue or pull request to the repository.

## License

The license for this project is the MIT License. It grants permission to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software and associated documentation files, subject to the condition that the original copyright notice and permission notice are included in all copies or substantial portions of the software. The software is provided "as is" without warranty of any kind, express or implied.
