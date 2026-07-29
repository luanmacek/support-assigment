# Support Assignment

## Overview

This repository contains my solution for the Support Engineer assignment.

The solution consists of:

* Incident triage answers (`answers.md`)
* Ansible playbook for deploying Orthanc (`playbook.yml`)
* Bash script for preparing the environment and running the playbook (`setup.sh`)
* Orthanc configuration (`files/orthanc.json`)

---

## Requirements

### Ubuntu / Debian

* Ansible
* Docker (installed automatically by the playbook)

### macOS

* Homebrew
* Docker Desktop

> **Note:** Docker Desktop must be installed and running before executing the playbook on macOS.

---

## Repository Structure

```text
.
├── answers.md
├── playbook.yml
├── setup.sh
├── requirements.yml
└── files
    └── orthanc.json
```

---

## Running the Assignment

Make the setup script executable:

```bash
chmod +x setup.sh
```

Run:

```bash
./setup.sh
```

The script will:

1. Verify that Ansible is installed.
2. Install the required Ansible collections.
3. Execute the Ansible playbook.

---

## What the Playbook Does

The playbook performs the following tasks:

* Detects the operating system.
* Installs or verifies Docker.
* Starts the Docker service (Linux) or Docker Desktop (macOS).
* Creates the Orthanc configuration directory.
* Copies the Orthanc configuration file.
* Pulls the latest Orthanc Docker image.
* Starts the Orthanc container.
* Waits until Orthanc becomes available.

---

## Verification

After a successful deployment, verify that the container is running:

```bash
docker ps
```

You should see an Orthanc container in the output.

The Orthanc web interface should be available at:

```text
http://localhost:8042
```

---

## Notes

This playbook is designed to support both Ubuntu/Debian and macOS. Platform-specific tasks are selected automatically based on the detected operating system.

The deployment is idempotent, meaning the playbook can be executed repeatedly without creating duplicate resources.
