# Kubernetes Models

The Kubernetes models are generated via the [swagger.json](https://github.com/kubernetes/kubernetes/tree/master/api/openapi-spec) file from the Kubernetes project. To generate the models the following steps can be used:

1. Create a temporary folder

    ```sh
    cd lib/models/kubernetes
    mkdir tmp
    cd tmp
    ```

2. Download the [OpenAPI Generator](https://github.com/OpenAPITools/openapi-generator#13---download-jar)

    ```sh
    # At the moment we are using the 6.0.x branch of the openapi-generator, therefor you have to build the the .jar file by your own.
    # wget https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/5.4.0/openapi-generator-cli-5.4.0.jar -O openapi-generator-cli.jar
    #
    # Clone and build the openapi-generator:
    #
    # git clone git@github.com:OpenAPITools/openapi-generator.git
    # ./mvnw clean install
    #
    # Copy the generated openapi-generator-cli.jar file:
    #
    # cp ../../../../../openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar .
    ```

3. Download the `swagger.json` file with the OpenAPI definition for Kubernetes

    ```sh
    wget https://raw.githubusercontent.com/kubernetes/kubernetes/v1.23.3/api/openapi-spec/swagger.json -O swagger.json
    ```

4. Remove all existing models in the `lib/models/kubernetes` folder

    ```sh
    rm -rf ../*.dart
    ```

5. Generate the models using the OpenAPI Generator

    ```sh
    java -jar openapi-generator-cli.jar generate -i swagger.json -g dart --enable-post-process-file
    ```

6. Copy the new models to the `lib/models/kubernetes` folder

    ```sh
    cp lib/api.dart ..
    cp lib/api_helper.dart ..
    cp lib/model/*.dart ..
    ```

7. Go back to the `lib/models/kubernetes` folder and delete the temporary directory

    ```sh
    cd ..
    rm -rf tmp
    ```

8. make some manual adjustments to the files and format them:

    ```sh
    for i in $(ls *.dart); do; flutter format "$i"; done
    ```

9. Run the code generation

    ```sh
    flutter packages pub run build_runner build
    ```
