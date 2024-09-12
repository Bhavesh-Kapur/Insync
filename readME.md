
## Building the Project

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/yourusername/project-management-portal.git
    cd project-management-portal
    ```

2. **Build the Project Using Maven:**

    Use the following Maven command to clean and build the project:

    ```bash
    mvn clean install
    ```

    This command will compile the project, run tests, and package the application into a WAR file located in the `target/` directory.

## Running Locally

1. **Start Apache Tomcat:**

    Ensure that your Apache Tomcat server is running. If not, you can start it using:

    ```bash
    {TOMCAT_HOME}/bin/startup.sh   # On Linux/Mac
    {TOMCAT_HOME}\bin\startup.bat  # On Windows
    ```

2. **Deploy the Application on Tomcat:**

    - Copy the generated WAR file from `target/project-management-portal.war` to the `webapps` directory of your Tomcat installation:

    ```bash
    cp target/project-management-portal.war {TOMCAT_HOME}/webapps/
    ```

    - Alternatively, you can use the Tomcat Manager to upload the WAR file.

3. **Access the Application:**

    Open a web browser and go to `http://localhost:8080/project-management-portal` to access the application.

## Basic Commands

- **Clean and Build the Project:**

    ```bash
    mvn clean install
    ```

- **Run the Application on an Embedded Tomcat Server:**

    If you want to run the project using an embedded Tomcat server, use:

    ```bash
    mvn tomcat7:run
    ```

    This will start the application on `http://localhost:8080/project-management-portal`.

## Deploying to Apache Tomcat

1. **Package the Project as a WAR file:**

    ```bash
    mvn package
    ```

    This will create a WAR file in the `target/` directory.

2. **Copy the WAR File to Tomcat's Webapps Directory:**

    ```bash
    cp target/project-management-portal.war {TOMCAT_HOME}/webapps/
    ```

3. **Restart Tomcat:**

    ```bash
    {TOMCAT_HOME}/bin/shutdown.sh   # Stop Tomcat
    {TOMCAT_HOME}/bin/startup.sh    # Start Tomcat
    ```




