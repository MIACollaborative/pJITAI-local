# mDOT pJITAI (Just-In-Time Adaptive Intervention) Web and REST API Interface

### About mDOT
The mHealth Center for Discovery, Optimization & Translation of Temporally-Precise Interventions is supported by the National Institutes of Health's National Institute of Biomedical Imaging and Bioengineering through its Biomedical Technology Resource Centers Program.

# Important note
The `setup.sh` script is Mac specific, using `homebrew` to setup the environment.

# Ways of Running this Repo

You can run this repo either on 1. local environment, or 2. Docker. Explanations on how to run Docker can be found under '2. Running on Docker.'

# 1. Running on Local
## Step 1: Setup Environment
```bash
source setup.sh
```

Running this bash script will setup the necessary environment for running. `chmod +x setup.sh` may be necessary in order to run it. Note that you can run the bash script as much as you want before running the repo (step 2), but *running it only once will setup the environment successfully*. Running it multiple times will update homebrew and pip to the latest version. Note that this file is assuming you will be using Mac environment and typical nginx path. For detailed explanations on what this bash script is doing and how to debug, refer to this [document](https://docs.google.com/document/d/1OXymWaQtf1ktAW6F5Q-c-ozTKyu9UjhKw9_rOy75p1Q/edit?usp=sharing). 

## Step 2: Run the Repo
Once environment setting has been done, use one of the following commands to run it.

```bash
python run.py
```
```bash
gunicorn --config gunicorn-cfg.py run:app
```
Both commands are doing the same task, but the difference is which server it is using. The first command uses Flask server to run it, and the second command uses gunicorn to run. During development, you can use the first command, but during production, gunicorn can be more appropriate.

Once the repo is running, you can go to `http://127.0.0.1:8080` to check the running repo. 

Check `DBMS = mysql+pymysql://root:pass@localhost:3306/pJITAI` is printed when `python run.py` or `gunicorn --config gunicorn-cfg.py run:app`

## Note: MySQL

If using `source setup.sh` does not work due to an error caused by password on MySQL, try changing the password using the next commands on MySQL prompt. 

```bash
ALTER USER 'root'@'localhost' IDENTIFIED BY 'pass';
FLUSH PRIVILEGES;
```

Use `brew services restart mysql` to restart MySQL with the new password.

## Note: Nginx

Use `sudo nginx -t` to check whether nginx document has no error. You can use `curl -l http://localhost:85` to check whether nginx is running successfully.

# 2. Running on Docker

We recommend using a native installation of [Visual Studio Code](https://code.visualstudio.com/) to edit and debug this project. Additionally, you will need [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/).  If you are using the interactive capabilities of Visual Studio Code, you will need to install the Python requirements located in the `requirements.txt` file.  Prior to installing these, you need to install a mysql-client and associated development files for the database library.  

## Configure your environment

Copy the `.env.template` file to a `.env` file. The defaults are appropriate for the standard docker-compose configuration. 

## Running the Docker Containers

```bash
docker-compose up
```

## Building the containers
The app needs to be rebuilt after any code change and the container needs to be replaced within the running Docker Compose system.

Build the container
```bash
docker-compose build
```

Run the following if you want to build and redeploy the container in an already running system.
```bash
docker-compose up --build --no-deps rl-app
```

## Interactive mode
If you want to debug the system, modify the `.env` file and change the following lines. This will allow you to run the system interactively outside of docker.

```
DB_HOST=localhost
DB_PORT=3307
```

You only need the mysql container once this is complete.

Start up the mysql container in the background
```bash
docker-compose up -d mysql
```
Once this is running, you can leave the container running and start/stop docker directly from your OS.  This container will automatically start when docker is launched if it is running when docker is shutdown.


Once this is complete, go to the `Run and Debug` tab and select the `Python: Run Server` from the menu.  This configuration has been preconfigured and will run the server.  It will respond to normal debugging procudures such as breakpoints.

## Import the HeartSteps example on the pJITAI web page
Run the docker and the Python server first, open a new terminal and then type this line in the new terminal
```
docker-compose exec mysql mysql -u root -ppass
use pJITAI;
```
Then go to the files, under the sql_data folder, find heartstep.sql document.
Copy the third line of the heartstep.sql document and paste the third line in the new terminal. 
