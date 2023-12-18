# MicroCI

MicroCI is a continuous integration server written in Dart that
integrates with GitHub webhooks to automate your CI/CD pipelines.
It also provides real-time logging and notifications through Telegram.

# Installation

Follow these steps to set up MicroCI:

1. Clone the Micro CI repository from GitHub.

    ```shell
    git clone https://github.com/your-username/micro-ci.git
    ```

1. Navigate to the project directory.

    ```shell
    cd micro-ci
    ```

1. Install the necessary dependencies (Dart SDK and packages).

    ```shell
    dart pub get
    ```

1. Create a .env file in the project root directory and set the following environment variables:
    ```env
    TELEGRAM_TOKEN = Your Telegram bot token.
    GITHUB_TOKEN = Your GitHub user token.
    CI_SERVER_API_ACCESS_TOKEN = A secret key for verifying GitHub webhook payloads.
    CI_SERVER_PORT = The port on which the CI server should listen.
    ```

1. Configure your GitHub repository to send webhook events to the Micro CI server URL.

1. Start the MicroCI server.

    ```shell
    dart run bin/server.dart
    ```

Now, Micro CI is up and running, ready to listen for GitHub webhook events and execute CI jobs.

# Configuration File
The configuration file ([config.yaml](config.yaml)) is used to define jobs and their associated tasks. Each job can have multiple tasks, and each task can execute a series of scripts or built-in actions.


## Built-in Actions

Micro CI supports several built-in actions that can be used within tasks:

1. apply_check_status

    This action allows you to create or update a GitHub status check for a
    commit. It has the following fields:

    ```yaml
      context: A descriptive label for the check.
      description: A short description of the check.
      state: The state of the check (pending, success, failure, etc.).
      targetUrl: The URL where more information about the check can be found.
    ```

1. collect_artifacts

    This action is used to collect and store (if needed) artifacts generated during a CI job. It has the following fields:

    ```yaml
      files: # List of files to be saved or marked as artifact
        - path_to_file
        - file:
          path: path_to_file_another
            name: Alternative name to be displayed in Telegram. # Optional.
            store: false # Implicit.
              # true -> marks file as artifact and copies file to artifacts folder.
              # false -> marks file as artifact without copying it.
            caption: Logs of 'docker compose up' command. # Optional.
              # Used in telegram post_artifacts
    ```
1. tg_msg

    This action sends a message to a Telegram chat. It has the following fields:
    ```yaml
      chat_id: The ID of the Telegram chat where the message should be sent.
      type: Type of action
      message: The message text.
    ```

# Contributing
Contributions to Micro CI are welcome! Feel free to fork the repository, make changes, and submit pull requests. 

# License
This project is licensed under the ISC License - see the LICENSE file for details.
