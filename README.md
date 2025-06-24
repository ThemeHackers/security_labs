<h1 align="center">🔐 Vulhub Lab Auto Starter</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Bash-Script-green?style=flat-square" />
  <img src="https://img.shields.io/badge/Docker-Required-blue?style=flat-square" />
  <img src="https://img.shields.io/badge/CTF-Ready-orange?style=flat-square" />
</p>

<p align="center">
  A simple but powerful Bash script to <strong>automatically start multiple vulnerable labs</strong> from <a href="https://github.com/vulhub/vulhub" target="_blank">Vulhub</a> using Docker Compose.<br>
  Ideal for ethical hacking practice, penetration testing labs, and CTF-style training environments.
</p>

---

## 🧰 Features

- ✅ One-command start for multiple Vulhub labs
- ✅ Smart directory detection and skipping of missing labs
- ✅ Color-coded terminal output for clarity
- ✅ Docker + Docker Compose environment check
- ✅ Easy to customize and extend

---

## 📦 Prerequisites

Make sure your system has the following installed:

- ✅ Docker  
- ✅ Docker Compose  
- ✅ Git  
- ✅ Linux-based OS (tested on Ubuntu 22.04)  

Installation steps
```bash
sudo chmod +x ./.install.sh
sudo ./.install.sh
```
If you want to check the running docker compose
```bash
sudo chmod +x ./.cklabs.sh
sudo ./.cklabs.sh
```
If you want to start a lab
```bash
sudo chmod +x ./.start.sh
sudo ./.start.sh
```
## ⚠️ Resource Usage Warning

> **Note:** Running multiple labs simultaneously using `docker-compose` can be **resource intensive**.  
>
> - If your system has **sufficient resources** (e.g., CPU, RAM, and disk space), you may **add more labs** to expand your environment.
> - Otherwise, it's recommended to **keep the default labs** to ensure stable performance.

## ⚠️ Troubleshooting

> - If you encounter a problem running docker compose caused by the port being used, edit the labs file by going in and running nano docker-compose.yml to edit the port within the file.



