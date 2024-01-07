## Installation

To install the application, follow the steps below:

1. Clone the repository:

   ```
   git clone https://github.com/azonedev/laradok.git
   ```

2. Navigate to the cloned directory:

   ```
   cd laradok
   ```

3. Update the installation script (provide your laravel repository):

   ```
   nano install.sh
   ```
   
4. Run the installation script:

   ```
   sh install.sh
   ```
   or 
   ```
   ./install.sh
   ```

## Configuration

Before running the installation script, review the `.env` file to set the environment variables. You can use `nano .env` to open the file for editing.

## Usage

To start the containers, run the following command:

```
docker-compose up -d
```

The containers can be accessed at:

- Nginx: `http://localhost:8081`
- Mailhog: `http://localhost:8025`

To stop the containers, run the following command:

```
docker-compose down
```

## Services

The following services are included in the `docker-compose.yml` file:

- Nginx: serves the Laravel application
- PHP: runs the Laravel application
- MySQL: stores the application data
- Mailhog: checking & testing the application emails on locally
- Redis: stores application cache and sessions
- Worker: managing background jobs 

## Volumes

The `./data` directory is used to store persistent data for the MySQL and Redis services.
